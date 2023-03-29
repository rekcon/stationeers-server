#!/bin/sh
touch /var/run/utmp
screen -S docker sh -c "sh /app/start.sh"