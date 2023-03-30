#!/bin/bash
touch /var/run/utmp
screen -S docker bash -c "bash -c /app/start.sh"