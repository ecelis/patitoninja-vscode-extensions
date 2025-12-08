# Patito Ninja VS Code Extension Pack

⚠️ **DEPRECATED: This extension pack is no longer maintained.**
It has been replaced by a new modular system. The PatitoNinja Base Pack has
been installed for you automatically.

Action Required:

1. Uninstall this extension (patitoninja-vscode-extensions).
2. Keep patitoninja-base.
3. Install the specific stack packs you need:
    - [Python Pack](https://marketplace.visualstudio.com/items?itemName=PatitoNinja.patitoninja-python)
    - [Web Pack](https://marketplace.visualstudio.com/items?itemName=PatitoNinja.patitoninja-web)
    - [Go Pack](https://marketplace.visualstudio.com/items?itemName=PatitoNinja.patitoninja-go)
    - [C/C++ Pack](https://marketplace.visualstudio.com/items?itemName=PatitoNinja.patitoninja-cpp)
    - [Base Pack](https://marketplace.visualstudio.com/items?itemName=PatitoNinja.patitoninja-base)  themes, git tools, docker, spell checking, and remote development utilities

This collection brings together the essential tools we use at Patito
Ninja to boost productivity and ensure consistent code quality.

It includes extensions for Python, TypeScript and Docker,
providing features like:

- Improved code formatting and linting
- Spell checker


## Build & Publish
 
Install `vsce`

```sh
npm install -g @vscode/vsce
```

Build

```sh
./package_all.sh
```

Publish

```sh
publish_all.sh
```
