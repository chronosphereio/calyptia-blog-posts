#!/bin/sh
set -eu

LOG_FILE=${LOG_FILE:-/logs/tracee.log}

exec >> "$LOG_FILE" 2>&1

"$@"
