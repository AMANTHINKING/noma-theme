#!/bin/zsh
set -euo pipefail

NODE_BIN="/Applications/Codex.app/Contents/Resources/node"
CLI_JS="/tmp/salla-cli-local/node_modules/@salla.sa/cli/dist/index.js"
THEME_LINK="/tmp/noma-theme"
LOCAL_HOME="/tmp/noma-preview-home"

if [[ ! -x "$NODE_BIN" ]]; then
  echo "Node is not available at $NODE_BIN"
  exit 1
fi

if [[ ! -f "$CLI_JS" ]]; then
  echo "Salla CLI is not installed at $CLI_JS"
  exit 1
fi

mkdir -p "$LOCAL_HOME"

if [[ ! -L "$THEME_LINK" ]]; then
  ln -s "/Users/nasserogab/Documents/New project/noma-theme" "$THEME_LINK"
fi

cd "$THEME_LINK"

COMMAND="${1:-preview}"
shift || true

case "$COMMAND" in
  login)
    HOME="$LOCAL_HOME" "$NODE_BIN" "$CLI_JS" login "$@"
    ;;
  preview)
    HOME="$LOCAL_HOME" "$NODE_BIN" "$CLI_JS" theme preview "$@"
    ;;
  preview-editor)
    HOME="$LOCAL_HOME" "$NODE_BIN" "$CLI_JS" theme preview --with-editor "$@"
    ;;
  version)
    HOME="$LOCAL_HOME" "$NODE_BIN" "$CLI_JS" --version "$@"
    ;;
  *)
    echo "Usage: ./run-salla-preview.sh [login|preview|preview-editor|version]"
    exit 1
    ;;
esac
