#!/usr/bin/env bash
set -euo pipefail

TOOLS_BIN="$(cd "$(dirname "$0")" && pwd)/bin"

add_to_posix_shell() {
  local shell_rc="$1"
  local marker='# claude-small-tools'
  if [ -f "$shell_rc" ] && grep -qF "$marker" "$shell_rc"; then
    echo "Already in $shell_rc"
    return
  fi
  echo "" >> "$shell_rc"
  echo "$marker" >> "$shell_rc"
  echo "export PATH=\"${TOOLS_BIN}:\$PATH\"" >> "$shell_rc"
  echo "Added to $shell_rc"
}

add_to_csh() {
  local shell_rc="$1"
  local marker='# claude-small-tools'
  if [ -f "$shell_rc" ] && grep -qF "$marker" "$shell_rc"; then
    echo "Already in $shell_rc"
    return
  fi
  echo "" >> "$shell_rc"
  echo "$marker" >> "$shell_rc"
  echo "setenv PATH ${TOOLS_BIN}:\$PATH" >> "$shell_rc"
  echo "Added to $shell_rc"
}

shell_name="$(basename "${SHELL:-/bin/sh}")"

case "$shell_name" in
  zsh)
    add_to_posix_shell "$HOME/.zshrc"
    ;;
  bash)
    add_to_posix_shell "$HOME/.bashrc"
    ;;
  csh|tcsh)
    add_to_csh "$HOME/.cshrc"
    ;;
  *)
    add_to_posix_shell "$HOME/.profile"
    ;;
esac

echo ""
echo "Done! Restart your shell or run:"
case "$shell_name" in
  csh|tcsh)
    echo "  setenv PATH ${TOOLS_BIN}:\$PATH"
    ;;
  *)
    echo "  export PATH=\"${TOOLS_BIN}:\$PATH\""
    ;;
esac
