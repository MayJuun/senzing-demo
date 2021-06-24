# senzing-demo

Based on [this](https://github.com/Senzing/docker-compose-demo) repo, wherein the Senzing stack is demonstrated using Docker Compose. [This](https://github.com/Senzing/docker-compose-demo/blob/master/docs/docker-compose-kafka-postgresql/README.md) specific configuration leverages Apache Kafka as the queue, and PostgreSQL as the database. 

The services in this stack can be displayed in the web browser after VNC-ing into the VM (instructions below) at the following localhost/port combinations:
 - Kafdrop (Web UI for Kafka) - `localhost:9179`
 - Senzing REST API (via OpenApi Editor) - `localhost:9180`
 - Senzing Entity Search WebApp - `localhost:8251`
 - PostgreSQL - `localhost:9171`
   - Defaults: `username: postgres` `password: postgres` 

## Virtual Machine Info:

### Cloud Provider:
Google Cloud

### Machine Type: 
e2-standard-2 (2 vCPUs, 8 GB memory)

### Image:
Ubuntu 16.04 Xenial

### Disk:
 - Size: 250GB
 - Type: SSD persistent disk

### Startup Script:
 - included in this repo as `startup-script.sh`

### Other Attributes:
 - Display Device is enabled, as we want to use screen sharing/recording tools (vnc, etc.)

## VNC Instructions (how to screen share your new cloud VM)
Coming Soon

