#!/usr/bin/env bash
# Common library for claude-small-tools

# Global model — set default per tool, overridden by flags
CLAUDE_MODEL="${CLAUDE_MODEL:-haiku}"
CLAUDE_EFFORT=""

# Parse model flags from args, removing them from the arg list
# Usage: parse_model_flags "$@"; set -- "${REMAINING_ARGS[@]}"
REMAINING_ARGS=()
parse_model_flags() {
  REMAINING_ARGS=()
  while [ $# -gt 0 ]; do
    case "$1" in
      --haiku)     CLAUDE_MODEL="haiku"; shift ;;
      --sonnet)    CLAUDE_MODEL="sonnet"; shift ;;
      --opus)      CLAUDE_MODEL="opus"; shift ;;
      --opus-fast) CLAUDE_MODEL="opus"; CLAUDE_EFFORT="low"; shift ;;
      *)           REMAINING_ARGS+=("$1"); shift ;;
    esac
  done
}

# Resolve text input from args, stdin, or interactive prompt
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

# Run claude with the selected model
# Usage: ask_claude "prompt"
ask_claude() {
  local label="${CLAUDE_MODEL}"
  [ -n "$CLAUDE_EFFORT" ] && label="${label}/fast"
  echo "Processing (${label})..." >&2

  local cmd=(claude -p --model "$CLAUDE_MODEL")
  [ -n "$CLAUDE_EFFORT" ] && cmd+=(--effort "$CLAUDE_EFFORT")
  "${cmd[@]}" "$1"
}

# Legacy alias
ask_haiku() {
  ask_claude "$1"
}
