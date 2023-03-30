#!/bin/bash
touch /var/run/utmp
printf '\033%%G'
screen -S docker bash -c "bash /app/start.sh"