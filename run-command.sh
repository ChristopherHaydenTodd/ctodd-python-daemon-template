#!/usr/bin/env bash
#
# Build and Tag .avro Cleaner Docker Image (Locally)
#

# Parse CLI Arguments
while [[ $# -gt 0 ]]
do
    key="$1"
    case $key in
        *)
        echo "$(date +%c): Ignoring Argument: ${key}"
        shift
        ;;
    esac
done


RUN_COMMAND="python3.6 /code/bin/start_python_daemon.py"
echo "$(date +%c): Running Command: ${RUN_COMMAND}"
eval "${RUN_COMMAND}"
