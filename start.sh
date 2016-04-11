#!/bin/bash
# -----------------------------------------------------------------------------
# docker /start script
# -----------------------------------------------------------------------------

# Checking if files exist to make sure we're backing up the database to data
if [ ! -f /opt/teamspeak/ts3server.sqlitedb ] && [ -f /data/ts3server.sqlitedb ]
then
    ln -s /data/ts3server.sqlitedb /opt/teamspeak/ts3server.sqlitedb
fi

if [ -f /opt/teamspeak/ts3server.sqlitedb ] && [ ! -f /data/ts3server.sqlitedb ]
then
    mv /opt/teamspeak/ts3server.sqlitedb /data/ts3server.sqlitedb
    ln -s /data/ts3server.sqlitedb /opt/teamspeak/ts3server.sqlitedb
fi

if [ -f /opt/teamspeak/ts3server.sqlitedb ] && [ -f /data/ts3server.sqlitedb ]
then
    rm /opt/teamspeak/ts3server.sqlitedb
    ln -s /data/ts3server.sqlitedb /opt/teamspeak/ts3server.sqlitedb
fi

# Start
cd /opt/teamspeak
exec /usr/bin/env LD_LIBRARY_PATH="/opt/teamspeak" /opt/teamspeak/ts3server inifile=/data/ts3server.ini logpath=/data/logs disable_db_logging=0
