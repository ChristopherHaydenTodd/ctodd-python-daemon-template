#!/usr/bin/env python3
"""
    Purpose:
        Python Daemon

    Steps:
        - Parse CLI Arguments into opts
        - Daemonize Process to Run Forever

    function call:
        python3 run_python_daemon.py {--opts}

    example call: python3 run_python_daemon.py
"""

# Python Library Imports
import logging
import os
import sys
import time
from argparse import ArgumentParser

def main():
    """
    Purpose:
        Main execution of the Clean AVRO Script
    """
    logging.info("Starting Python Daemon")

    opts = get_options()

    while True:
        logging.info("Heartbeat")
        time.sleep(5)

    logging.info("Python Daemon Complete")


###
# General/Helper Methods
###


def get_options():
    """
    Purpose:
        Parse CLI arguments for script
    Args:
        N/A
    Return:
        N/A
    """

    parser = ArgumentParser(description="Python Daemon")
    required = parser.add_argument_group('Required Arguments')
    optional = parser.add_argument_group('Optional Arguments')

    # Optional Arguments
    # N/A

    # Required Arguments
    # N/A

    return parser.parse_args()


if __name__ == "__main__":

    log_level = logging.INFO
    logging.getLogger().setLevel(log_level)
    logging.basicConfig(
        stream=sys.stdout,
        level=log_level,
        format="[start_python_daemon] %(asctime)s %(levelname)s %(message)s",
        datefmt="%a, %d %b %Y %H:%M:%S"
    )

    try:
        main()
    except Exception as err:
        logging.exception(
            "{0} failed due to error: {1}".format(os.path.basename(__file__), err)
        )
        raise
