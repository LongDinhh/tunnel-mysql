#!/bin/bash

echo -n "Creating SSH tunnel to $HOST... "
ssh -4 -q -N -f -T -M -L 0.0.0.0:13306:$HOST:3306 ads2v.dev
echo "Done!"

export MYSQL_PWD=$PASSWORD
mysql -e 'SHOW DATABASES;' --user $USERNAME -h 127.0.0.1 -P 13306

tail -f /dev/null
