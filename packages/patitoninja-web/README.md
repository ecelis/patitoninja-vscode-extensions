# Patito Ninja VS Code Web Pack

## Features

- [Patito Nina Base Pack](https://marketplace.visualstudio.com/items?itemName=PatitoNinja.patitoninja-base) enhancements
- VS Code Debugger for Firefox
- VS Code Eslint, integrates [ESLint](http://eslint.org/) into VS Code.
- Prettier Formatter for Visual Studio Code
- 
## Installation

To install the extension just execute the following command in the Command Palette of Visual Studio Code:

```sh
ext install patitoninja-web
```

## Usage

### VS Code Debugger for Firefox

#### Getting Started

You can use this extension in **launch** or **attach** mode.

In **launch** mode it will start an instance of Firefox navigated to the start page of your application
and terminate it when you stop debugging. You can also set the `reAttach` option in your launch configuration to `true`, in this case Firefox won't be terminated at the end of your debugging session and the debugger will re-attach to it when
you start the next debugging session - this is a lot faster than restarting Firefox every time. `reAttach` also works for WebExtension debugging: in this case, the WebExtension is (re-)installed as a [temporary add-on](https://developer.mozilla.org/en-US/Add-ons/WebExtensions/Temporary_Installation_in_Firefox).

In **attach** mode the extension connects to a running instance of Firefox (which must be manually
configured to allow remote debugging - see [below](#attach)).

To configure these modes you must create a file `.vscode/launch.json` in the root directory of your
project. You can do so manually or let VS Code create an example configuration for you by clicking 
the gear icon at the top of the Debug pane.

Finally, if `.vscode/launch.json` already exists in your project, you can open it and add a 
configuration snippet to it using the *"Add Configuration"* button in the lower right corner of the
editor.

#### Launch
Here's an example configuration for launching Firefox navigated to the local file `index.html` 
in the root directory of your project:
```json
{
    "version": "0.2.0",
    "configurations": [
        {
            "name": "Launch index.html",
            "type": "firefox",
            "request": "launch",
            "reAttach": true,
            "file": "${workspaceFolder}/index.html"
        }
    ]
}
```

You may want (or need) to debug your application running on a Webserver (especially if it interacts
with server-side components like Webservices). In this case replace the `file` property in your
`launch` configuration with a `url` and a `webRoot` property. These properties are used to map
urls to local files:
```json
{
    "version": "0.2.0",
    "configurations": [
        {
            "name": "Launch localhost",
            "type": "firefox",
            "request": "launch",
            "reAttach": true,
            "url": "http://localhost/index.html",
            "webRoot": "${workspaceFolder}"
        }
    ]
}
```
The `url` property may point to a file or a directory, if it points to a directory it must end with
a trailing `/` (e.g. `http://localhost/my-app/`).
You may omit the `webRoot` property if you specify the `pathMappings` manually. For example, the
above configuration would be equivalent to
```json
{
    "version": "0.2.0",
    "configurations": [
        {
            "name": "Launch localhost",
            "type": "firefox",
            "request": "launch",
            "reAttach": true,
            "url": "http://localhost/index.html",
            "pathMappings": [{
                "url": "http://localhost",
                "path": "${workspaceFolder}"
            }]
        }
    ]
}
```
Setting the `pathMappings` manually becomes necessary if the `url` points to a file or resource in a
subdirectory of your project, e.g. `http://localhost/login/index.html`.

#### Attach
To use attach mode, you have to launch Firefox manually from a terminal with remote debugging enabled.
Note that if you don't use Firefox Developer Edition, you must first configure Firefox to allow
remote debugging. To do this, open the Developer Tools Settings and check the checkboxes labeled
"Enable browser chrome and add-on debugging toolboxes" and "Enable remote debugging"
(as described [here](https://developer.mozilla.org/en-US/docs/Tools/Remote_Debugging/Debugging_Firefox_Desktop#Enable_remote_debugging)).
Alternatively you can set the following values in `about:config`:

Preference Name                       | Value   | Comment
--------------------------------------|---------|---------
`devtools.debugger.remote-enabled`    | `true`  | Required
`devtools.chrome.enabled`             | `true`  | Required
`devtools.debugger.prompt-connection` | `false` | Recommended
`devtools.debugger.force-local`       | `false` | Set this only if you want to attach VS Code to Firefox running on a different machine (using the `host` property in the `attach` configuration)

Then close Firefox and start it from a terminal like this:

__Windows__

`"C:\Program Files\Mozilla Firefox\firefox.exe" -start-debugger-server`

(This syntax is for a regular command prompt (cmd.exe), not PowerShell!)

__OS X__

`/Applications/Firefox.app/Contents/MacOS/firefox -start-debugger-server`

__Linux__

`firefox -start-debugger-server`

Navigate to your web application and use this `launch.json` configuration to attach to Firefox:
```json
{
    "version": "0.2.0",
    "configurations": [
        {
            "name": "Launch index.html",
            "type": "firefox",
            "request": "attach"
        }
    ]
}
```

If your application is running on a Webserver, you need to add the `url` and `webRoot` properties
to the configuration (as in the second `launch` configuration example above).

### VS Code ESLint extension

Integrates [ESLint](http://eslint.org/) into VS Code. If you are new to ESLint check the [documentation](http://eslint.org/).

The extension uses the ESLint library installed in the opened workspace folder.
If the folder doesn't provide one, the extension looks for a global install version.
If you haven't installed ESLint either locally or globally, do so by running:

**Local install (recommended):**

```bash
# npm
npm install --save-dev eslint

# yarn
yarn add --dev eslint

# pnpm
pnpm add --save-dev eslint

# bun
bun add --dev eslint
```

**Global install:**

```bash
# npm
npm install -g eslint

# yarn
yarn global add eslint

# pnpm
pnpm add -g eslint

# bun
bun add -g eslint
```

On new projects you might need to create an ESLint configuration file.
For ESLint v9 and later (or v8.57+ with flat config), this should be one of:

- eslint.config.js (most common)
- eslint.config.mjs
- eslint.config.cjs
- eslint.config.ts
- eslint.config.mts

You can generate a starter config by running:

`npx eslint --init`

Read more about [ESLint CLI](https://eslint.org/docs/latest/use/command-line-interface).

For projects using older ESLint versions (< 8.57), use a legacy `.eslintrc` file (`.eslintrc.json`, `.eslintrc.js`, etc.).

If you're using the legacy version, consider reading [how to migrate to flat config](https://eslint.org/docs/latest/use/configure/migration-guide).

### Prettier Formatter for Visual Studio Code

#### Default Formatter

To ensure that Prettier Formatter is used over other extensions you may have installed, be sure to set it as the default formatter in your VS Code settings. This setting can be set for all languages or by a specific language.

```json
{
  "editor.defaultFormatter": "esbenp.prettier-vscode",
  "[javascript]": {
    "editor.defaultFormatter": "esbenp.prettier-vscode"
  }
}
```

#### Usage

##### Using Command Palette (CMD/CTRL + Shift + P)

```
1. CMD + Shift + P -> Format Document
OR
1. Select the text you want to Prettify
2. CMD + Shift + P -> Format Selection
```

#### Keyboard Shortcuts

Visual Studio Code provides [default keyboard shortcuts](https://code.visualstudio.com/docs/getstarted/keybindings#_keyboard-shortcuts-reference) for code formatting. You can learn about these for each platform in the [VS Code documentation](https://code.visualstudio.com/docs/getstarted/keybindings#_keyboard-shortcuts-reference).

If you don't like the defaults, you can rebind `editor.action.formatDocument` and `editor.action.formatSelection` in the keyboard shortcuts menu of vscode.

#### Format On Save

Respects `editor.formatOnSave` setting.

You can turn on format-on-save on a per-language basis by scoping the setting:

```json
// Set the default
"editor.formatOnSave": false,
// Enable per-language
"[javascript]": {
    "editor.formatOnSave": true
}
```

#### Format Selection

Format selection works on several languages depending on what Prettier itself supports. The following languages currently are supported:

```
javascript
javascriptreact
typescript
typescriptreact
json
graphql
handlebars
```

#### Format Document (Forced)

If you would like to format a document that is configured to be ignored by Prettier either because it is in a `.prettierignore` file or part of a normally excluded location like `node_modules`, you can run the command **Format Document (Forced)** to force the document to be formatted. Forced mode will also ignore any config for `requirePragma` allowing you to format files without the pragma comment present.

##### Linter Integration

The recommended way of integrating with linters is to let Prettier do the formatting and configure the linter to not deal with formatting rules. You can find instructions on how to configure each linter on the Prettier docs site. You can then use each of the linting extensions as you normally would. For details refer to the [Prettier documentation](https://prettier.io/docs/en/integrating-with-linters.html).

#### Using Code Actions on Save

You can use VS Code's `editor.codeActionsOnSave` to run Prettier before other formatters like ESLint. This is useful when you want to format with Prettier first and then apply ESLint fixes.

```jsonc
// .vscode/settings.json
{
  "editor.codeActionsOnSave": {
    "source.fixAll.prettier": "explicit",
  },
}
```

You can also combine Prettier with ESLint:

```jsonc
// .vscode/settings.json
{
  "editor.codeActionsOnSave": {
    "source.fixAll.prettier": "explicit",
    "source.fixAll.eslint": "explicit",
  },
}
```

> **Note:** The `source.fixAll.prettier` code action respects your `editor.defaultFormatter` setting. If you have set a different default formatter (e.g., ESLint with Prettier plugin), the Prettier code action will not run unless you explicitly enable it with `"source.fixAll.prettier": "explicit"` or `"source.fixAll.prettier": "always"`. This prevents double-formatting when using setups like `eslint-plugin-prettier`.

