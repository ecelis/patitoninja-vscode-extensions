# Patito Ninja VS Code Base Pack

## Features

- Code Spell Checker
- Color Highlight, styles css/web colors found in your document. 
- Todo Tree, quickly searches [ripgrep](https://github.com/BurntSushi/ripgrep) your workspace for comment tags like TODO and FIXME, and displays them in a tree view in the activity bar.
- Remote Development, allows you to open any folder in a container, remote machine or in WSL.
- Tokyo Night Color Theme (optional)
- VS Code Icons pack (optional)

## Installation

To install the extension just execute the following command in the Command Palette of Visual Studio Code:

```sh
ext install patitoninja-base
```

## Usage

### VSCode Icons

Once installed and after reloading `vscode`, you will be presented with a message to `Activate` the icons.

In case this doesn't happen, navigate to:

- `Linux` & `Windows` `=>` **File > Preferences > Themes > File Icon Theme > VSCode Icons**.
- `MacOS` `=>` **Code > Settings > Themes > File Icon Themes > VSCode Icons**.

### Tokyo Night Color Theme

- `Linux` & `Windows` `=>` **File > Preferences > Theme > Color Theme > Tokyo Night**.
- `MacOS` `=>` **Code > Settings > Themes > Color Theme > Tokyo Night**.

### Code Spell Checker

#### Functionality

Load a TypeScript, JavaScript, Text, etc. file. Words not in the dictionary files will have
a squiggly underline.

#### Suggestions

To see the list of suggestions:

After positioning the cursor in the word, any of the following should display the list of suggestions:

- Click on the 💡 (lightbulb) in the left hand margin.
- [`Quick Fix`](https://code.visualstudio.com/docs/getstarted/keybindings#_rich-languages-editing) Editor action command:
    - Mac: `⌘`+`.` or `Cmd`+`.`
    - PC: `Ctrl`+`.`

#### Supported Languages

- English (US)
- Spanish (ES)

#### Enable Dictionary

Commands (use `F1` or _View -> Command Palette..._):

- `Enable Spanish Spell Checker Dictionary`
- `Enable Spanish Spell Checker Dictionary in Workspace`

#### Disable Dictionary

Commands (use `F1` or _View -> Command Palette..._):

- `Disable Spanish Spell Checker Dictionary`
- `Disable Spanish Spell Checker Dictionary in Workspace`

#### Manual Settings

This is done with the `language` setting.

_Preferences_ -> _Settings_

Adding `es` or `es-ES` to the `cSpell.language` setting, will enable the Spanish dictionary.
Example using both English and Spanish dictionaries:

```javascript
"cSpell.language": "en,es",
```

### Todo Tree

See documents on marketplace [Todo Tree](https://marketplace.visualstudio.com/items?itemName=Gruntfuggly.todo-tree)

### Visual Studio Code Remote Development

Running into trouble? Wondering what you can do? These articles can help.

- [Overview](https://aka.ms/vscode-remote)
- [Remote Development using SSH](https://aka.ms/vscode-remote/ssh)
- [Developing inside a Container](https://aka.ms/vscode-remote/containers)
- [Developing in WSL](https://aka.ms/vscode-remote/wsl)
- [Tips, Tricks, and Troubleshooting](https://aka.ms/vscode-remote/troubleshooting)