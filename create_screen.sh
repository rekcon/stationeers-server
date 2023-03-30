#!/bin/bash
touch /var/run/utmp
screen -S docker bash "bash /app/start.sh"