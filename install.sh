#!/usr/bin/env sh

# Only evaluate and declare if SCRIPT_DIR is not already set
if [ -z "${SCRIPT_DIR+x}" ]; then
    # 1. Detect the current file path across Bash and Zsh
    _CURRENT_FILE="${BASH_SOURCE:-${(%):-%x}}"

    # 2. Extract the directory and lock it down so sourced files cannot modify it
    readonly SCRIPT_DIR="$(cd "$(dirname "$_CURRENT_FILE")" && pwd)"

    # 3. Cleanup the temporary variable
    unset _CURRENT_FILE
fi

mkdir -p "${HOME}/.config/tmux"
ln -s "${SCRIPT_DIR}/.tmux.conf" "${HOME}/.config/tmux/tmux.conf"
