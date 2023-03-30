#!/bin/bash
touch /var/run/utmp
screen -S docker bash -c "bash /app/start.sh"