# Patito Ninja VS Code Extension Packs

⚠️ **The original extension pack is no longer maintained.**
It has been replaced by a new modular system.

Action Required:

1. **Optional** If prevouosly installed (patitoninja-vscode-extensions),
   remove that.
2. Add or keep patitoninja-base.
3. Install the specific stack packs you need:

- [Base Pack](https://marketplace.visualstudio.com/items?itemName=PatitoNinja.patitoninja-base) themes, git tools, docker, spell checking, and remote development utilities

- [Python Pack](https://marketplace.visualstudio.com/items?itemName=PatitoNinja.patitoninja-python)
- [Web Pack](https://marketplace.visualstudio.com/items?itemName=PatitoNinja.patitoninja-web)
- [Go Pack](https://marketplace.visualstudio.com/items?itemName=PatitoNinja.patitoninja-go)
- [C/C++ Pack](https://marketplace.visualstudio.com/items?itemName=PatitoNinja.patitoninja-cpp)

This collection brings together the essential tools we use at Patito
Ninja to boost productivity and ensure consistent code quality.

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

## Recommended Extensions

- `postman.postman-for-vscode`
- `github.copilot-chat`
- `github.vscode-github-actions`
- `ban.spellright`
