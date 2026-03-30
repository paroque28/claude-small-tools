#!/usr/bin/env bash
# Common library for claude-small-tools

# Resolve text input from args, stdin, or show usage and exit
# Usage: text="$(resolve_input "$usage_msg" "$@")"
resolve_input() {
  local usage="$1"
  shift

  # Check for help flags
  if [ "${1:-}" = "-h" ] || [ "${1:-}" = "--help" ]; then
    echo "$usage" >&2
    exit 0
  fi

  if [ $# -gt 0 ]; then
    printf '%s' "$*"
  elif [ ! -t 0 ]; then
    cat
  else
    # Interactive: prompt the user for input (Enter submits)
    echo "Enter text (press Enter to submit):" >&2
    local line
    read -r line
    printf '%s' "$line"
  fi
}

# Run claude with haiku model
# Usage: ask_haiku "prompt"
ask_haiku() {
  echo "Processing..." >&2
  claude -p --model haiku "$1"
}
