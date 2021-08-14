# senzing-demo

Based on [this](https://github.com/Senzing/docker-compose-demo) repo, wherein the Senzing stack is demonstrated using Docker Compose. [This](https://github.com/Senzing/docker-compose-demo/blob/master/docs/docker-compose-kafka-postgresql/README.md) specific configuration leverages Apache Kafka as the queue, and PostgreSQL as the database. 

The services in this stack can be displayed in the web browser after VNC-ing into the VM (instructions below) at the following localhost/port combinations:
 - Kafdrop (Web UI for Kafka) - `localhost:9179`
 - Senzing REST API (via OpenApi Editor) - `localhost:9180`
 - Senzing Entity Search WebApp - `localhost:8251`
 - PostgreSQL - `localhost:9171`
   - Defaults: `username: postgres` `password: postgres` 

## Virtual Machine Info:

### Cloud Provider Options:
- AWS
- Google Cloud

### Machine Type: 
- AWS: t2.xlarge (4 vCPUs, 16 GiB memory)
- GCP: e2-standard-4 (4 vCPUs, 16 GB memory)

### Image:
Ubuntu 20.04 Xenial

### Disk:
 - Size: 250GB
 - Type: SSD persistent disk

### Startup Script:
 - AWS deployment script included in this repo as `aws-startup-script.sh`
 - GCP deployment script included in this repo as `gcp-startup-script.sh`

### Other Attributes:
 - Display Device is enabled, as we want to use screen sharing/recording tools (vnc, etc.)

### Other Notes:
 - This infra setup takes about 10-15 mins (as we have a desktop environment, and a VNC server to install/configure), so please allow yourself some time to deploy this when giving a demo (also a good time to hydrate).

## VNC Instructions (how to screen share your new cloud VM) - GCP Only

(Server)
 - Login as root with `sudo su -`
 - Run command `tightvncserver`
 - Set/Confirm password: `s3NZ1nG`
 - Answer 'n' for the view-only pw question
 - Edit file with nano `nano /root/.vnc/xstartup`
   - Paste the following there:
     ```
     #!/bin/sh
     autocutsel -fork
     xrdb $HOME/.Xresources
     xsetroot -solid grey
     export XKL_XMODMAP_DISABLE=1
     export XDG_CURRENT_DESKTOP="GNOME-Flashback:Unity"
     export XDG_MENU_PREFIX="gnome-flashback-"
     unset DBUS_SESSION_BUS_ADDRESS
     gnome-session --session=gnome-flashback-metacity --disable-acceleration-check --debug &
     ```
 - Exit out of file
 - Kill the vnc server `vncserver -kill :1`
 - Start vnc server again with `vncserver -geometry 1024x640`

(Client - MacOS Only)
- Install `VNC Viewer`
- Point to 'Localhost: 5901'

## Synthea to Senzing

  - This branch is to show how to use this to create patients using synthea, and transform them into Senzing patients.
  - You can try and use the senzing directory in this repo, although it may not work properly
  - If it doesn't, you can follow the [instructions](https://github.com/synthetichealth/synthea)
  - Briefly
    1. Run the following: ```$ git clone https://github.com/synthetichealth/synthea.git```
    2. Go to the following directory: ```synthea/src/main/resources```
    3. Open the file synthea.properties
    4. Change the line ```exporter.fhir.bulk_data = false``` to ```exporter.fhir.bulk_data = true```
    5. Return to the primary synthea directory, and run: ```$ ./run_synthea -p 10``` (the number after the p is how many patients you want to generate) 
      - the first time this command downloads a number of dependencies, but gets quicker after that.
      - also, there are ways to construct certain patient populations at the github instructions link above
    6. Find the file ```synthea/output/fhir/Patient.ndjson```, and copy it into ```fhir_to_senzing/lib/new_test_data```
