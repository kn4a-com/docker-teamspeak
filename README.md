# Docker Alpine Teamspeak

Prepare:
```
mkdir -p /data/teamspeak
touch /data/teamspeak/ts3server.sqlitedb
chown -R 503:503 /data/teamspeak
```

Pull:
```
docker pull skardoska/teamspeak
```
Run:
```
docker run -d --net=host --name alpine-teamspeak \
-v /data/teamspeak:/data \
-v /data/teamspeak/ts3server.sqlitedb:/opt/teamspeak/ts3server.sqlitedb \
orimani/alpine-teamspeak:latest \
logpath=/data/logs/ \
query_ip_whitelist=/data/query_ip_whitelist.txt \
query_ip_blacklist=/data/query_ip_blacklist.txt
```

To get the server admin query login/pass and admin token for the first client connection:
```
docker logs -f teamspeak
```
