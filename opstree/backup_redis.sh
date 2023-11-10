!/bin/bash

# Set the current date and time
TIMESTAMP=$(date +"%Y%m%d%H%M%S")

# Backup the Redis data
kubectl exec -it redis-leader-0 -- redis-cli -c SAVE
sleep 30
kubectl cp default/redis-leader-0:/data/dump.rdb ./backup/dump_$TIMESTAMP.rdb
