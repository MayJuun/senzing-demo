import 'dart:convert';
import 'dart:io';

import 'package:fhir_to_senzing/short_test.dart';
import 'senzing_person.dart';

void main() async {
  await ingestAndOutput();
  await ingestAndOutputFhir();
}

Future<void> ingestAndOutput() async {
  var personList = '[';
  shortTest.forEach((person) =>
      personList += '${jsonEncode(SenzingPerson.fromJson(person).toJson())},');
  personList = personList.substring(0, personList.length - 1);
  personList += ']';
  await File('transformedList.json').writeAsString(personList);
}

Future<void> ingestAndOutputFhir() async {
  var personList = '[';
  shortTest.forEach((person) => personList +=
      '${jsonEncode(SenzingPerson.fromJson(person).toFhirPatient().toJson())},');
  personList = personList.substring(0, personList.length - 1);
  personList += ']';
  await File('transformedList.json').writeAsString(personList);
}
