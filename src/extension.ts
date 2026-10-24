import * as vscode from "vscode";
import * as fs from "fs";
import axios from "axios";

function getConfigurationTarget(): vscode.ConfigurationTarget {
    return vscode.workspace.workspaceFolders?.length
        ? vscode.ConfigurationTarget.Workspace
        : vscode.ConfigurationTarget.Global;
}

// Cleaned up version of https://github.com/sumneko/lua-language-server/wiki/EmmyLua-Libraries
export async function setExternalLibrary(
    extension: vscode.Extension<any>,
    folder: string,
    enable: boolean
): Promise<void> {
    const extensionPath = extension.extensionPath;

    const config = vscode.workspace.getConfiguration("Lua");
    const library = [
        ...(config.get<string[]>("workspace.library") ?? [])
    ];

    if (!extensionPath) {
        return;
    }

    for (let i = library.length - 1; i >= 0; i--) {
        const el = library[i];
        const isSelfExtension = el.includes(extension.id);
        const isCurrentVersion = el.includes(extensionPath);

        if (isSelfExtension && !isCurrentVersion) {
            library.splice(i, 1);
        }
    }

    const index = library.indexOf(folder);

    if (enable && index === -1) {
        library.push(folder);
    } else if (!enable && index !== -1) {
        library.splice(index, 1);
    }

    await config.update(
        "workspace.library",
        library,
        getConfigurationTarget()
    );
}

async function ensureLuaPreloadFileSize(): Promise<void> {
    if (!vscode.workspace.workspaceFolders?.length) {
        return;
    }

    const config = vscode.workspace.getConfiguration("Lua");
    const setting = config.inspect<number>("workspace.preloadFileSize");

    // Respect explicit user and workspace preferences.
    if (
        setting?.globalValue !== undefined ||
        setting?.workspaceValue !== undefined ||
        setting?.workspaceFolderValue !== undefined
    ) {
        return;
    }

    const current = config.get<number>("workspace.preloadFileSize", 500);

    if (current < 2000) {
        await config.update(
            "workspace.preloadFileSize",
            2000,
            vscode.ConfigurationTarget.Workspace
        );
    }
}
let WORKING_DIRECTORY = "ERROR";

export function activate(context: vscode.ExtensionContext) {
	WORKING_DIRECTORY = context.extensionPath + "/EmmyLua/";
	fs.rmSync(WORKING_DIRECTORY, { recursive: true, force: true });
	fs.mkdirSync(WORKING_DIRECTORY);

	// Get annotations
	axios
		.get<string>(
			"https://raw.githubusercontent.com/nanos-world/vscode-extension/docgen-output/annotations.lua"
		)
		.then(async (response) => {
			fs.writeFileSync(
				`${WORKING_DIRECTORY}annotations.lua`,
				response.data
			);

			await ensureLuaPreloadFileSize();

			await setExternalLibrary(
				context.extension,
				WORKING_DIRECTORY,
				true
			);

			console.log("nanos world sumneko bindings loaded!");
		})
		.catch((exception) => {
			console.log(
				`Failed to get documentation from the repository: ${exception}`
			);
		});
}

// This doesnt actually do anything as it's impossible to edit the config from the deactivate (and uninstall) events
export function deactivate(context: vscode.ExtensionContext) {
	fs.rmSync(WORKING_DIRECTORY, { recursive: true, force: true });
	setExternalLibrary(context.extension, WORKING_DIRECTORY, false);
	console.log("nanos world sumneko bindings unloaded");
}
