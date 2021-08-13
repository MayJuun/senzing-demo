import 'dart:convert';
import 'dart:io';

import 'package:collection/collection.dart';
import 'package:fhir/r4.dart';
import 'package:fhir_to_senzing/examples/short_test.dart';
import 'examples/loadtest-dataset-1M copy.dart';
import 'examples/short_fhir_to_senzing.dart';
import 'models/models.dart';

void main() async {
  // await ingestSenzingAndOutputSenzing();
  // await ingestSenzingAndOutputFhir();
  // await ingestFhirAndOutputFhir();
  // for (var p in senzingPeopleList) {
  for (var p in shortTest) {
    final tempPatient = SenzingPerson.fromJson(p).toFhirPatient();
    if (tempPatient != null) {
      print(SenzingPerson.fromFhir(tempPatient).toJson());
      print(DeepCollectionEquality()
          .equals(SenzingPerson.fromFhir(tempPatient).toJson(), p));
    }
  }
}

Future<void> ingestSenzingAndOutputFhir() async {
  var personList = '[';
  shortTest.forEach((person) => personList +=
      '${jsonEncode(SenzingPerson.fromJson(person).toFhirPatient()?.toJson())},');
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
