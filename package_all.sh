#!/bin/bash

set -e

PACKAGES=(
  "patitoninja-base"
  "patitoninja-python"
  "patitoninja-web"
  "patitoninja-go"
  "patitoninja-cpp"
)

mkdir -p dist
echo "📂 Created 'dist/' directory for artifacts."

if ! command -v vsce &>/dev/null; then
  echo "❌ Error: 'vsce' is not installed."
  echo "   Please run: npm install -g @vscode/vsce"
  exit 1
fi

echo "🚀 Starting build process..."

for pack in "${PACKAGES[@]}"; do
  echo "--------------------------------------------------"
  echo "📦 Packaging: $pack"
  echo "--------------------------------------------------"

  if [ -d "packages/$pack" ]; then
    cd "packages/$pack"
  else
    echo "❌ Error: Directory packages/$pack not found!"
    exit 1
  fi

  rm -f *.vsix

  vsce package --out "../../dist/$pack.vsix"

  cd ../../
done

echo "--------------------------------------------------"
echo "🎉 Build Complete!"
echo "   The following files are ready in the 'dist/' folder:"
ls -lh dist/
