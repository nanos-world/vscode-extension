import { getInput } from "@actions/core";
import { getOctokit } from "@actions/github";

import * as fs from "fs";
import { Agent, setGlobalDispatcher } from "undici";

import type {
	Authority,
	Docs,
	DocClass,
	DocEnum,
	DocFunction,
	DocParameter,
	DocReturn,
	DocEvent,
	DocEnumValue,
	DocDescriptive,
	DocTyped,
	DocConstructor,
} from "./schema.d.ts";

console.log("Building documentation...");

const TOKEN = getInput("github-token");
const REPO_OWNER = getInput("repository-owner");
const REPO_NAME = getInput("repository-name");
const REPO_BRANCH = getInput("repository-branch");

// Set global dispatcher with 30 second connect timeout
setGlobalDispatcher(new Agent({
	connect: {
		timeout: 60000, // 60 seconds connect timeout
	},
}));

const octokit = getOctokit(TOKEN);

// Path category constants for class types
const PATH_CATEGORIES = {
	CLASSES: "Classes",
	STATIC_CLASSES: "StaticClasses",
	STRUCTS: "Structs",
	UTILITY_CLASSES: "UtilityClasses",
} as const;

const ENUMS_FILE = "Enums.json";

type PathCategory = typeof PATH_CATEGORIES[keyof typeof PATH_CATEGORIES];

/**
 * Determines the category of a JSON file path for classification purposes.
 * @returns The category name, or null if not a class-like file
 */
function getPathCategory(path: string): PathCategory | null {
	for (const category of Object.values(PATH_CATEGORIES)) {
		if (path.startsWith(category)) {
			return category;
		}
	}
	return null;
}

const DOCS_BASE_URL = "https://docs.nanos-world.com/docs/scripting-reference/";
function generateDocsLink(
	jsonFileName: string,
	name: string,
	type: string,
	opts?: Partial<{
		parent: string,
		isEnum: boolean,
		isStatic: boolean,
	}>
): string {
	let url = DOCS_BASE_URL;
	const { parent, isEnum, isStatic } = opts ?? {};
	if (isEnum) {
		url += `glossary/enums#${name.toLowerCase()}`;
	}
	else {
		url += `${type}/`;
		if (parent) {
			const functionType = isStatic ? "static-function" : "function";
			if (!isStatic && jsonFileName.startsWith("Classes/Base")) {
				url += "base-classes/";
			}
			url += `${parent.toLowerCase()}#${functionType}-${name.toLowerCase()}`;
		} else {
			url += `${name.toLowerCase()}`;
		}
	}

	return `<a href="${url}">docs</a>`;
}

const RAW_ASSETS_BASE_URL = "https://raw.github.com/nanos-world/vscode-extension/master/assets/";
function generateAuthorityString(authority: Authority) {
	switch (authority) {
		case "server":
			return `<img src="${RAW_ASSETS_BASE_URL}server-only.png" height="21"> <b>[Server Side]</b>`;
		case "client":
			return `<img src="${RAW_ASSETS_BASE_URL}client-only.png" height="21"> <b>[Client Side]</b>`;
		case "authority":
			return `<img src="${RAW_ASSETS_BASE_URL}authority-only.png" height="21"> <b>[Authority Side]</b>`;
		case "network-authority":
			return `<img src="${RAW_ASSETS_BASE_URL}network-authority.png" height="21"> <b>[Network Authority]</b>`;
		case "both-net-authority-first":
			return `<img src="${RAW_ASSETS_BASE_URL}both-net-authority-first.png" height="21"> <b>[Both Sides (Network Authority First)]</b>`;
		//case "both":
		default:
			return `<img src="${RAW_ASSETS_BASE_URL}both.png" height="21"> <b>[Client/Server Side]</b>`;
	}
}

const OPERATORS = {
	__unm: "unm",
	__bnot: "bnot",
	__len: "len",
	__add: "add",
	__sub: "sub",
	__mul: "mul",
	__div: "div",
	__mod: "mod",
	__pow: "pow",
	__idiv: "idiv",
	__band: "band",
	__bor: "bor",
	__bxor: "bxor",
	__shl: "shl",
	__shr: "shr",
	__concat: "concat",
	__call: "call",
};

function generateDocstring(
	obj: DocDescriptive,
	jsonFileName?: string
): string {
	return (
		obj.description_long === undefined
			? obj.description === undefined
				? ""
				: obj.description
			: obj.description_long
	).replaceAll("\n", "<br>");
}

function generateInlineDocstring(
	descriptive: DocDescriptive,
	jsonFileName?: string
): string {
	let docstring = generateDocstring(descriptive, jsonFileName);
	return docstring.length > 0 ? `@${docstring}` : "";
}

function generateParamDocstring(
	param: DocParameter,
	jsonFileName?: string
): string {
	let docstring = generateInlineDocstring(param, jsonFileName);
	if (param.default !== undefined) {
		docstring += `${docstring.length > 0 ? " " : "@"}(Default: ${param.default.length === 0 ? '""' : param.default})`;
	}
	return docstring;
}

interface LuaType {
	name: string;
	array: boolean;
}

class ComplexType {
	public optional: boolean = false;
	public typenames: LuaType[] = [];

	private mapTypename(name: string) {
		if (name.endsWith("Path")) {
			return "string";
		}

		switch (name) {
			case "float":
				return "number";
			default:
				return name;
		}
	}

	public toString = (): string => {
		let ret = "";
		this.typenames.forEach((type) => {
			ret += this.mapTypename(type.name);
			if (type.array) ret += "[]";
			ret += "|";
		});
		ret = ret.slice(0, -1);
		return ret;
	};
}

function generateType(typed: DocTyped): ComplexType {
	let complexType = new ComplexType();

	let typeString = typed.type;
	if (typeString.endsWith("?")) {
		complexType.optional = true;
		typeString = typeString.slice(0, -1);
	} else if (typed.default !== undefined) {
		complexType.optional = true;
	}

	if (typed.table_properties === undefined) {
		typeString.split("|").forEach((typename) => {
			let type: LuaType = {
				name: typename,
				array: false,
			};

			if (type.name.endsWith("[]")) {
				type.array = true;
				type.name = type.name.slice(0, -2);
			}

			complexType.typenames.push(type);
		});
	} else {
		complexType.typenames.push({
			name: `{ ${typed.table_properties
				.map(
					(prop) =>
						`${prop.name}: ${generateType({
							type: prop.type,
						}).toString()}`,
				)
				.join(", ")} }`,
			array: typeString.endsWith("[]"),
		});
	}

	return complexType;
}

function generateReturns(
	rets?: DocReturn[],
	jsonFileName?: string
): string {
	if (rets === undefined) return "";
	return rets
		.map((ret) => {
			const type = generateType(ret);
			return `\n---@return ${type.toString() + (type.optional ? "?" : "")} ${generateInlineDocstring(ret, jsonFileName)}`;
		})
		.join("");
}

// This can be refactored out once the overload rework on the language server is done
function generateInlineReturns(
	rets?: DocReturn[],
	areAllOptional?: boolean,
): string {
	if (rets === undefined) return "";
	return (
		": " +
		rets
			.map((ret) => {
				const type = generateType(ret);
				return (
					type.toString() +
					(areAllOptional || type.optional ? "?" : "")
				);
			})
			.join(", ")
	);
}

function generateParams(
	params?: DocParameter[],
	jsonFileName?: string
): {
	string: string;
	names: string;
} {
	let ret = { string: "", names: "" };
	if (params === undefined) return ret;

	params.forEach(function (param) {
		param.name = param.name ?? "missing_name";
		if (param.name.endsWith("...")) param.name = "...";
		param.name = param.name.replaceAll("/", "_"); // bug-fix until Syed gives us more definite answer...

		const type = generateType(param);
		ret.string += `\n---@param ${param.name}${type.optional ? "?" : ""
			} ${type.toString()} ${generateParamDocstring(param, jsonFileName)}`;
		ret.names += param.name + ", ";
	});

	ret.names = ret.names.slice(0, -2);
	return ret;
}

function generateInlineParams(params: DocParameter[]): string {
	return params
		.map((param) => {
			param.name = param.name ?? "missing_name";
			const type = generateType(param);
			return `${param.name}${type.optional ? "?" : ""
				}: ${type.toString()}`;
		})
		.join(", ");
}

function generateFunction(
	jsonFileName: string,
	fun: DocFunction,
	className: string,
	accessor: string = "",
	isStatic: boolean = false,
	isStruct: boolean = false,
): string {
	const params = generateParams(fun.parameters);
	return `

---${generateAuthorityString(fun.authority)}
---${generateDocsLink(jsonFileName, fun.name, isStatic ? "static-classes" : isStruct ? "structs" : "classes", { parent: className, isStatic })}
---
---${generateDocstring(fun, jsonFileName)}${params.string}${generateReturns(fun.return, jsonFileName)}
function ${accessor}${fun.name}(${params.names}) end`;
}

function generateConstructor(
	constructor: DocConstructor,
	className: string,
): string {
	const params = generateInlineParams(constructor.parameters);
	return `\n---@overload fun(${params}): ${className}`;
}

function generateClassAnnotations(
	jsonFileName: string,
	classes: Record<string, DocClass>,
	cls: DocClass,
): string {
	let inheritance = "";
	if (cls.inheritance !== undefined) {
		inheritance = ` : ${cls.inheritance.join(", ")}`;
	}

	const constructors =
		cls.constructors?.reduce(
			(prev, constructor) =>
				prev + generateConstructor(constructor, cls.name),
			"",
		) ?? "";

	let staticFunctions = "";
	if (cls.static_functions !== undefined) {
		[...cls.static_functions]
			.sort((a, b) => a.name.localeCompare(b.name))
			.forEach((fun) => {
				if (
					(fun.name === "Subscribe" || fun.name === "Unsubscribe") &&
					cls.name !== "Events"
				) {
					return;
				}

				staticFunctions += generateFunction(
					jsonFileName,
					fun,
					cls.name,
					`${cls.name}.`,
					true,
					cls.struct
				);
			});
	}

	let functions = "";
	if (cls.functions !== undefined) {
		[...cls.functions]
			.sort((a, b) => a.name.localeCompare(b.name))
			.forEach((fun) => {
				if ((fun.name === "Subscribe" || fun.name === "Unsubscribe") &&
					cls.name !== "Events"
				) {
					return;
				}

				functions += generateFunction(
					jsonFileName,
					fun,
					cls.name,
					`${cls.name}:`,
					false,
					cls.struct
				);
			});
	}

	let events = "";
	if (cls.events !== undefined) {
		let combinedEvents: Record<string, DocEvent> = {};
		if (cls.inheritance !== undefined) {
			cls.inheritance.forEach((clsName) => {
				classes[clsName].events?.forEach((inheritedEvent) => {
					combinedEvents[inheritedEvent.name] = inheritedEvent;
				});
			});
		}
		cls.events.forEach((event) => {
			combinedEvents[event.name] = event;
		});

		let subOverloadsSelf = "";
		let unsubOverloadsSelf = "";
		let subOverloads = "";
		let unsubOverloads = "";
		Object.entries(combinedEvents)
			.sort(([aName], [bName]) => aName.localeCompare(bName))
			.forEach(([_, event]) => {
				let callbackSig = "";
				if (event.arguments !== undefined) {
					callbackSig = event.arguments
						.map((param, idx) => {
							const type = generateType(param);
							return `${param.name}${type.optional ? "?" : ""}: ${idx !== 0 || param.name !== "self"
								? type.toString()
								: cls.name
								}`;
						})
						.join(", ");
				}
				callbackSig = `fun(${callbackSig})${generateInlineReturns(
					event.return,
					true,
				)}`;

				subOverloadsSelf += `\n---@overload fun(self: ${cls.name}, event_name: "${event.name
					}", callback: ${callbackSig}): ${callbackSig} ${generateInlineDocstring(
						event,
					)}`;

				subOverloads += `\n---@overload fun(event_name: "${event.name
					}", callback: ${callbackSig}): ${callbackSig} ${generateInlineDocstring(
						event,
					)}`;

				unsubOverloadsSelf += `\n---@overload fun(self: ${cls.name}, event_name: "${event.name
					}", callback: ${callbackSig}) ${generateInlineDocstring(event)}`;

				unsubOverloads += `\n---@overload fun(event_name: "${event.name
					}", callback: ${callbackSig}) ${generateInlineDocstring(event)}`;
			});

		events = `

${!cls.staticClass
				? `
---Subscribe to an event
---@param event_name string @Name of the event to subscribe to
---@param callback function @Function to call when the event is triggered
---@return function @The callback function passed${subOverloads}
function ${cls.name}.Subscribe(event_name, callback) end
`
				: ""
			}

---Subscribe to an event
---@param event_name string @Name of the event to subscribe to
---@param callback function @Function to call when the event is triggered
---@return function @The callback function passed${cls.staticClass ? subOverloads : subOverloadsSelf}
function ${cls.name}${cls.staticClass ? "." : ":"
			}Subscribe(event_name, callback) end

---Unsubscribe from an event
---@param event_name string @Name of the event to unsubscribe from
---@param callback? function @Optional callback to unsubscribe (if no callback is passed then all callbacks in this Package will be unsubscribed from this event)${cls.staticClass ? unsubOverloads : unsubOverloadsSelf}
function ${cls.name}${cls.staticClass ? "." : ":"
			}Unsubscribe(event_name, callback) end

${!cls.staticClass
				? `
---Unsubscribe from an event
---@param event_name string @Name of the event to unsubscribe from
---@param callback? function @Optional callback to unsubscribe (if no callback is passed then all callbacks in this Package will be unsubscribed from this event)${unsubOverloads}
function ${cls.name}.Unsubscribe(event_name, callback) end
`
				: ""
			}`;
	}

	let fields = "";
	if (cls.properties !== undefined) {
		[...cls.properties]
			.sort((a, b) => a.name.localeCompare(b.name))
			.forEach((prop) => {
				fields += `\n---@field ${prop.name} ${generateType(
					prop,
				).toString()} ${generateInlineDocstring(prop)}`;
			});
	}

	const staticFields = cls.static_properties?.length
		? `\n${cls.static_properties.map((field) => `${cls.name}.${field.name} = ${field.value}`).join("\n")}`
		: "";

	let operators = "";
	if (cls.operators !== undefined) {
		[...cls.operators]
			.sort((a, b) => a.operator.localeCompare(b.operator))
			.filter((op) => op.operator in OPERATORS)
			.forEach((op) => {
				operators += `\n---@operator ${OPERATORS[op.operator as keyof typeof OPERATORS]
					}(${generateType({ type: op.rhs }).toString()}): ${generateType(
						{ type: op.return },
					).toString()}`;
			});
	}

	return `

---${generateAuthorityString(cls.authority)}
---${generateDocsLink(jsonFileName, cls.name, cls.staticClass ? "static-classes" : cls.struct ? "structs" : "classes")}
---
---${generateDocstring(cls, jsonFileName)}
---@class ${cls.name}${inheritance}${fields}${operators}${constructors}
${cls.name} = {}${staticFields}${staticFunctions}${functions}${events}`;
}

function generateEnum(
	name: string,
	values: DocEnumValue[]
): string {
	let valuesString = "";
	values.forEach((value) => {
		valuesString += `\n    ${value.key} = ${value.value},${value.description ? ` -- ${value.description}` : ""}`;
	});

	return `

---${generateDocsLink(ENUMS_FILE, name, "glossary/enums", { isEnum: true })}
---@enum ${name}
${name} = {${valuesString.slice(0, -1)}
}`;
}

async function buildDocs() {
	const response = await octokit.request(
		"GET /repos/{owner}/{repo}/git/trees/{tree_sha}",
		{
			owner: REPO_OWNER,
			repo: REPO_NAME,
			tree_sha: REPO_BRANCH,
			recursive: "1",
		},
	);

	const docs: Docs = {
		classes: {},
		enums: {},
	};

	const promises = response.data.tree
		.filter(function (entry) {
			return entry.type === "blob" && entry.path?.endsWith(".json");
		})
		.map((entry) =>
			(async () => {
				if (entry.path === undefined || entry.path.startsWith("_")) {
					return;
				}

				console.log(`Processing ${entry.path}...`);

				const response = await octokit.request(
					"GET /repos/{owner}/{repo}/contents/{path}",
					{
						accept: "application/vnd.github+json",
						owner: REPO_OWNER,
						repo: REPO_NAME,
						path: entry.path,
						ref: REPO_BRANCH,
					},
				);

				if (!response || !response.data || Array.isArray(response.data) || response.data.type !== "file") {
					return;
				}

				const file = response.data;
				if (file.content === undefined) {
					return;
				}

				// Use Buffer for base64 decoding (Node.js native approach)
				const jsonContent = Buffer.from(file.content, "base64").toString("utf-8");
				const fileContents = JSON.parse(jsonContent) as DocClass;
				fileContents.jsonFileName = entry.path;

				// Handle Enums file
				if (entry.path === ENUMS_FILE) {
					docs.enums = fileContents as unknown as Record<string, DocEnum>;
					return;
				}

				// Handle class-like files using extracted category logic
				const category = getPathCategory(entry.path);
				if (category !== null) {
					fileContents.staticClass =
						category === PATH_CATEGORIES.STATIC_CLASSES ||
						category === PATH_CATEGORIES.UTILITY_CLASSES;
					fileContents.struct = category === PATH_CATEGORIES.STRUCTS;
					docs.classes[fileContents.name] = fileContents;
				}
			})(),
		);
	await Promise.all(promises);

	let output = "---@meta";

	Object.entries(docs.classes)
		.sort(([aName], [bName]) => aName.localeCompare(bName))
		.forEach(([name, cls]) => {
			output += generateClassAnnotations(cls.jsonFileName ?? name, docs.classes, cls);
		});

	Object.entries(docs.enums)
		.sort(([aName], [bName]) => aName.localeCompare(bName))
		.forEach(([name, { enums: values }]) => {
			if (!values || values.length === 0) return;
			const sortedValues = [...values].sort((a, b) =>
				a.key.localeCompare(b.key),
			);
			output += generateEnum(name, sortedValues);
		});

	try {
		await fs.promises.mkdir("./docs");
	}
	catch {
		// it is fine if it exists already
	}
	await fs.promises.writeFile("./docs/annotations.lua", output);
}

export async function run(): Promise<void> {
	await buildDocs();
	console.log("Build finished");
}
