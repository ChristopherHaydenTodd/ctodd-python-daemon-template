#!/usr/bin/env bash
#
# HealthCheck for Daemon
#

RUN_COMMAND="python3.6 /code/bin/start_python_daemon.py"

if pgrep -f "^${RUN_COMMAND}" > /dev/null
then
    echo "Pass: '${RUN_COMMAND}' Running"
    exit 0
else
    echo "Failure: '${RUN_COMMAND}' Not Running"
    exit 1
fi
