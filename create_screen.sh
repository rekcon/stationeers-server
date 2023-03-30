#!/bin/bash
touch /var/run/utmp
screen -S docker /bin/bash "/bin/bash /app/start.sh"