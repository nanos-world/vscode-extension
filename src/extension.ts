import * as vscode from "vscode";
import * as fs from "fs";
import axios from "axios";

// Cleaned up version of https://github.com/sumneko/lua-language-server/wiki/EmmyLua-Libraries
export function setExternalLibrary(extension: vscode.Extension<any>, folder: string, enable: boolean) {
	const extensionPath = extension.extensionPath;

	const config = vscode.workspace.getConfiguration("Lua");
	const library: string[] | undefined = config.get("workspace.library");

	if (library && extensionPath) {
		// remove any older versions of our path e.g. "publisher.name-0.0.1"
		for (let i = library.length - 1; i >= 0; i--) {
			const el = library[i];
			const isSelfExtension = el.indexOf(extension.id) > -1;
			const isCurrentVersion = el.indexOf(extensionPath) > -1;
			if (isSelfExtension && !isCurrentVersion) {
				library.splice(i, 1);
			}
		}

		const index = library.indexOf(folder);
		if (enable) {
			if (index === -1) {
				library.push(folder);
			}
		} else {
			if (index > -1) {
				library.splice(index, 1);
			}
		}

		config.update("workspace.library", library, true);
	}
}

let WORKING_DIRECTORY = "ERROR";

export function activate(context: vscode.ExtensionContext) {
	WORKING_DIRECTORY = context.extensionPath + "/EmmyLua/";
	fs.rmSync(WORKING_DIRECTORY, { recursive: true, force: true });
	fs.mkdirSync(WORKING_DIRECTORY);

	// Get annotations
	axios.get("https://raw.githubusercontent.com/nanos-world/vscode-extension/docgen-output/annotations.lua").then(function (response) {
		// Write annotations
		fs.writeFileSync(`${WORKING_DIRECTORY}annotations.lua`, response.data);

		// Update Lua.workspace.library
		setExternalLibrary(context.extension, WORKING_DIRECTORY, true);

		console.log("nanos world sumneko bindings loaded!");
	}).catch((exception) => console.log(`Failed to get documentation from the repository: ${exception}`));
}

// This doesnt actually do anything as it's impossible to edit the config from the deactivate (and uninstall) events
export function deactivate(context: vscode.ExtensionContext) {
	fs.rmSync(WORKING_DIRECTORY, { recursive: true, force: true });
	setExternalLibrary(context.extension, WORKING_DIRECTORY, false);
	console.log("nanos world sumneko bindings unloaded");
}
