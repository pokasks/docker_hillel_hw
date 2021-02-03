#!/bin/sh
sleep 30
DB='db1'
USER='db1_u01'
PASS='u01secret'
HOST='mysqldb-hillel'
/usr/bin/mysql -u $USER -p$PASS -h $HOST $DB < ./test.sql
exit 0

