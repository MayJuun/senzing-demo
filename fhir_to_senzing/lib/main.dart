import 'dart:convert';
import 'dart:io';

import 'package:collection/collection.dart';
import 'package:fhir/r4.dart';
import 'package:fhir_to_senzing/examples/short_test.dart';
import 'examples/senzing_people_list.dart';
import 'examples/short_fhir_to_senzing.dart';
import 'examples/test_patient.dart';
import 'models/models.dart';

void main() async {
  print(jsonEncode(SenzingPerson.fromFhir(Patient.fromJson(testPatient))
      .toFhirPatient()
      .toJson()));
  // await ingestSenzingAndOutputSenzing();
  // await ingestSenzingAndOutputFhir();
  // await ingestFhirAndOutputFhir();
  // for (var p in senzingPeopleList) {
  //   final senzingPatient = SenzingPerson.fromJson(p);
  //   final tempPatient = senzingPatient.toFhirPatient();
  //   if (tempPatient != null) {
  //     if (!DeepCollectionEquality()
  //         .equals(SenzingPerson.fromFhir(tempPatient).toJson(), p)) {
  //       // print(senzingPatient.toJson());
  //       // print(SenzingPerson.fromFhir(tempPatient).toJson());
  //     }
  //   }
  // }
}

Future<void> ingestSenzingAndOutputFhir() async {
  var personList = '[';
  shortTest.forEach((person) => personList +=
      '${jsonEncode(SenzingPerson.fromJson(person).toFhirPatient().toJson())},');
  personList = personList.substring(0, personList.length - 1);
  personList += ']';
  await File('lib/examples/senzingToFhir.json').writeAsString(personList);
}

Future<void> ingestSenzingAndOutputSenzing() async {
  var personList = '[';
  shortTest.forEach((person) =>
      personList += '${jsonEncode(SenzingPerson.fromJson(person).toJson())},');
  personList = personList.substring(0, personList.length - 1);
  personList += ']';
  await File('lib/examples/senzingToSenzing.json').writeAsString(personList);
}

Future<void> ingestFhirAndOutputFhir() async {
  var personList = '[';
  shortFhirToSenzing.forEach((person) => personList +=
      '${jsonEncode(SenzingPerson.fromFhir(Patient.fromJson(person)).toJson())},');
  personList = personList.substring(0, personList.length - 1);
  personList += ']';
  await File('lib/examples/fhirToSenzing.json').writeAsString(personList);
}
