import 'dart:convert';
import 'dart:io';

import 'package:csv/csv.dart';
import 'package:fhir/r4.dart';
import 'package:fhir_to_senzing/models/models.dart';
import 'package:fhir_to_senzing/models/senzing_person/country_codes.dart';
import 'package:fhir_to_senzing/models/senzing_person/state_license.dart';

Future<void> main() async {
  final patientList = <String>[];
  final senzingTruthList = <String>[];
  final senzingConvertedList = <String>[];
  final newFile = await File('lib/truth_set/truth_set.csv').readAsString();
  final rows = const CsvToListConverter().convert(newFile);
  for (var r in rows) {
    if (r[0] != 'CLUSTER_ID') {
      var senzingPerson = SenzingPerson(
        recordId: r[1] == null || r[1] == '' ? null : r[1].toString(),
        nameLast: r[2] == null || r[2] == '' ? null : r[2].toString(),
        nameFirst: r[3] == null || r[3] == '' ? null : r[3].toString(),
        nameMiddle: r[4] == null || r[4] == '' ? null : r[4].toString(),
        gender: r[5] == null || r[5] == '' ? null : r[5].toString(),
        dateOfBirth: r[6] == null || r[6] == '' ? null : r[6].toString(),
        passportNumber: r[7] == null || r[7] == '' ? null : r[7].toString(),
        passportCountry: r[8] == null || r[8] == '' ? null : r[8].toString(),
        driversLicenseNumber:
            r[9] == null || r[9] == '' ? null : r[9].toString(),
        driversLicenseState:
            r[10] == null || r[10] == '' ? null : r[10].toString(),
        ssnNumber: r[11] == null || r[11] == '' ? null : r[11].toString(),
        ssnLast4: r[12] == null || r[12] == '' ? null : r[12].toString(),
        nationalIdNumber:
            r[13] == null || r[13] == '' ? null : r[13].toString(),
        nationalIdCountry:
            r[14] == null || r[14] == '' ? null : r[14].toString(),
        addrLine1: r[15] == null || r[15] == '' ? null : r[15].toString(),
        addrCity: r[16] == null || r[16] == '' ? null : r[16].toString(),
        addrState: r[17] == null || r[17] == '' ? null : r[17].toString(),
        addrPostalCode: r[18] == null || r[18] == '' ? null : r[18].toString(),
        addrCountry: r[19] == null || r[19] == '' ? null : r[19].toString(),
        phoneList:
            (r[20] != null && r[20] != '') || (r[21] != null && r[21] != '')
                ? <SenzingPhoneNumber>[]
                : null,
      );
      if (r[20] != null && r[20] != '') {
        senzingPerson.phoneList!.add(SenzingPhoneNumber(
            phoneType: 'home', phoneNumber: r[20].toString()));
      }
      if (r[21] != null && r[21] != '') {
        senzingPerson.phoneList!.add(SenzingPhoneNumber(
            phoneType: 'mobile', phoneNumber: r[21].toString()));
      }

      var patient = Patient(
        identifier: [
          Identifier(
            value: r[0],
            type: CodeableConcept(
              text: 'Senzing Cluster ID',
              coding: [
                Coding(
                  system: FhirUri('https://senzing.com/clusterid'),
                  code: Code(r[0]),
                ),
              ],
            ),
          ),
          Identifier(
            value: r[1].toString(),
            type: CodeableConcept(
              text: 'Senzing Record ID',
              coding: [
                Coding(
                  system: FhirUri('https://senzing.com/recordid'),
                  code: Code(r[1].toString()),
                ),
              ],
            ),
          ),
        ],
        name: (r[2] == null || r[2] == '') &&
                (r[3] == null || r[3] == '') &&
                (r[4] == null || r[4] == '')
            ? null
            : [
                HumanName(
                  family: r[2] == null || r[2] == '' ? null : r[2],
                  given: (r[3] == null || r[3] == '') &&
                          (r[4] == null || r[4] == '')
                      ? null
                      : (r[4] == null || r[4] == '')
                          ? [r[3]]
                          : (r[3] == null || r[3] == '')
                              ? [r[4]]
                              : [r[3], r[4]],
                )
              ],
        gender: r[5] == null || r[5] == ''
            ? null
            : r[5].toString().toLowerCase().contains('f')
                ? PatientGender.female
                : r[5].toString().toLowerCase().contains('m')
                    ? PatientGender.male
                    : null,
        birthDate: r[6] == null || r[6] == '' ? null : Date(r[6]),
        address: [
          Address(
            line: r[15] == null || r[15] == '' ? null : [r[15]],
            city: r[16] == null || r[16] == '' ? null : r[16],
            state: r[17] == null || r[17] == '' ? null : r[17],
            postalCode: r[18] == null || r[18] == '' ? null : r[18].toString(),
            country: r[19] == null || r[19] == '' ? null : r[19],
          )
        ],
      );

      if ((r[7] != null && r[7] != '') || (r[8] != null && r[8] != '')) {
        patient.identifier!.add(
          Identifier(
            type: CodeableConcept(
              coding: [
                Coding(
                    system: FhirUri(
                        'http://terminology.hl7.org/CodeSystem/v2-0203'),
                    code: Code('PPN'),
                    display: 'Passport Number'),
              ],
              text: 'Passport Number',
            ),
            system: r[8] == null ||
                    r[8] == '' ||
                    (r[8]!.length != 2 && r[8]!.length != 3)
                ? null
                : FhirUri('http://hl7.org/fhir/sid/passport-' +
                    (r[8]!.length == 3
                        ? r[8]!.toLowerCase()
                        : countryCodes[r[8]!.toLowerCase()] ?? '')),
            value: r[7] != null && r[7] != '' ? null : r[7].toString(),
          ),
        );
      }
      if ((r[9] != null && r[9] != '') || (r[10] != null && r[10] != '')) {
        patient.identifier!.add(
          Identifier(
            type: CodeableConcept(
              coding: [
                Coding(
                    system: FhirUri(
                        'http://terminology.hl7.org/CodeSystem/v2-0203'),
                    code: Code('DL'),
                    display: 'Driver\'s license number'),
              ],
              text: 'Driver\'s License',
            ),
            system: r[10] == null ||
                    r[10] == '' ||
                    licenseStateToUri[r[10]!.toUpperCase()] == null
                ? null
                : FhirUri(licenseStateToUri[r[10]!.toUpperCase()]),
            value: r[9] == null || r[9] == '' ? null : r[9].toString(),
          ),
        );
      }
      if ((r[11] != null && r[11] != '') || (r[12] != null && r[12] != '')) {
        patient.identifier!.add(Identifier(
          type: CodeableConcept(
            coding: [
              Coding(
                  system:
                      FhirUri('http://terminology.hl7.org/CodeSystem/v2-0203'),
                  code: Code('SS'),
                  display: 'Social Security number'),
            ],
            text: 'Social Security Number',
          ),
          system: FhirUri('http://hl7.org/fhir/sid/us-ssn'),
          value: r[11] == null || r[11] == ''
              ? r[12] == null || r[12] == ''
                  ? null
                  : r[12].toString()
              : r[11].toString(),
        ));
      }
      if ((r[20] != null && r[20] != '') ||
          (r[21] != null && r[21] != '') ||
          (r[22] != null && r[22] != '')) {
        if (patient.telecom == null) {
          patient = patient.copyWith(telecom: []);
        }
        if (r[20] != null && r[20] != '') {
          patient.telecom!.add(
            ContactPoint(
              system: ContactPointSystem.phone,
              value: r[20].toString(),
              use: ContactPointUse.home,
            ),
          );
        }
        if (r[21] != null && r[21] != '') {
          patient.telecom!.add(
            ContactPoint(
              system: ContactPointSystem.phone,
              value: r[21],
              use: ContactPointUse.mobile,
            ),
          );
        }
        if (r[22] != null && r[22] != '') {
          patient.telecom!.add(
            ContactPoint(
              system: ContactPointSystem.email,
              value: r[22],
            ),
          );
        }
      }
      patientList.add(jsonEncode(patient.toJson()));
      senzingConvertedList
          .add(jsonEncode(SenzingPerson.fromFhir(patient).toJson()));
      senzingTruthList.add(jsonEncode(senzingPerson.toJson()));
    }
  }
  var senzingTruthString = '';
  var senzingConvertedString = '';
  var patientString = '';
  patientList.forEach((element) {
    patientString += '\n$element';
  });
  senzingConvertedList.forEach((element) {
    senzingConvertedString += '\n$element';
  });
  senzingTruthList.forEach((element) {
    senzingTruthString += '\n$element';
  });
  await File('lib/truth_set/truth_set_fhir.ndjson')
      .writeAsString(patientString);
  await File('lib/truth_set/truth_set_senzing_converted.ndjson')
      .writeAsString(senzingConvertedString);
  await File('lib/truth_set/truth_set_senzing_truth.ndjson')
      .writeAsString(senzingTruthString);
}
