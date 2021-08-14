final testPatient = {
  "resourceType": "Patient",
  "id": "af162a7c-992b-ab6c-a571-e0d4589d9a3e",
  "identifier": [
    {
      "type": {
        "coding": [
          {
            "system": "http://terminology.hl7.org/CodeSystem/v2-0203",
            "code": "SS",
            "display": "Social Security Number"
          }
        ],
        "text": "Social Security Number"
      },
      "system": "http://hl7.org/fhir/sid/us-ssn",
      "value": "999-83-2589"
    },
    {
      "type": {
        "coding": [
          {
            "system": "http://terminology.hl7.org/CodeSystem/v2-0203",
            "code": "DL",
            "display": "Driver's License"
          }
        ],
        "text": "Driver's License"
      },
      "system": "urn:oid:2.16.840.1.113883.4.3.25",
      "value": "S99985611"
    },
    {
      "type": {
        "coding": [
          {
            "system": "http://terminology.hl7.org/CodeSystem/v2-0203",
            "code": "PPN",
            "display": "Passport Number"
          }
        ],
        "text": "Passport Number"
      },
      "system":
          "http://standardhealthrecord.org/fhir/StructureDefinition/passportNumber",
      "value": "X33881089X"
    }
  ],
  "name": [
    {
      "use": "official",
      "family": "Rau926",
      "given": ["Lisbeth69"],
      "prefix": ["Mrs."]
    },
    {
      "use": "maiden",
      "family": "Watsica258",
      "given": ["Lisbeth69"],
      "prefix": ["Mrs."]
    }
  ],
  "telecom": [
    {"system": "phone", "value": "555-748-4452", "use": "home"}
  ],
  "gender": "female",
  "birthDate": "1988-08-01",
  "address": [
    {
      "line": ["131 Waters Tunnel"],
      "city": "Boston",
      "state": "MA",
      "postalCode": "02215",
      "country": "US"
    }
  ],
};
