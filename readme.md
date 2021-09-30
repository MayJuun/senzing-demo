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

### Other Notes:
 - This infra setup takes about 10-15 mins, so please allow yourself some time to deploy this when giving a demo (also a good time to hydrate).

## Import FHIR-Compliant Data into Senzing App
 - After Docker Containers are up, ssh into the `senzing-ssh` container with `docker exec -it senzing-sshd /bin/bash`
 - Navigate to the config tools directory for senzing with `cd /opt/senzing/g2/python/`
 - Add data sources for FHIR-compliant patient lists with the Config Tool python file `python3 G2ConfigTool.py`
   - `addDataSource {"dataSource":"Patient_List_1"}`
   - `addDataSource {"dataSource":"Patient_List_2"}`
   - `addDataSource {"dataSource":"Patient_List_3"}`
   - `addDataSource {"dataSource":"Deceased_List_1"}`
   - `save`
   - `(y/n)` type 'y'
 - Grab the ndjson file with the FHIR-Compliant data from the storage bucket `curl -o demo.json https://storage.googleapis.com/senzing-fhir-test/demo-set.ndjson`
 - Load the file with `python3 G2Loader.py -f demo-set.ndjson`


## Synthea<sup>TM</sup> to Senzing

  - This branch is to show how to use this to create patients using Synthea<sup>TM</sup>, and transform them into Senzing patients
  - Synthea<sup>TM</sup> is patient generating software from [here](https://github.com/synthetichealth/synthea), I don't think I'm breaking any rules since it's open source by hosting it as part of this repo, but if I am, please let me know, and I'll remove it
  - You can try and use the senzing directory in this repo, although it may not work properly
  - If it doesn't, you can follow the [instructions](https://github.com/synthetichealth/synthea)
  - Briefly
    1. Run the following: ```$ git clone https://github.com/synthetichealth/synthea.git```
    2. Go to the following directory: ```synthea/src/main/resources```
    3. Open the file synthea.properties
    4. Change the line ```exporter.fhir.bulk_data = false``` to ```exporter.fhir.bulk_data = true```
    5. Return to the primary synthea directory, and run: ```$ ./run_synthea -p 10``` (the number after the p is how many patients you want to generate) 
      - the first time running this command downloads a number of dependencies, but gets quicker after that
      - also, there are ways to construct certain patient populations at the github instructions link above
    6. Find the file ```synthea/output/fhir/Patient.ndjson```, and copy it into ```fhir_to_senzing/lib/new_test_data```
    7. Lastly, run the file ```fhir_to_senzing/lib/create_new_test_data.dart```
    8. There should now be a file ```fhir_to_senzing/lib/new_test_data/SenzingPerson.ndjson```
