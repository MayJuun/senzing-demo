import 'dart:convert';
import 'dart:io';

import 'package:fhir/r4.dart';
import 'package:fhir_bulk/r4/from_bulk.dart';
import 'package:fhir_to_senzing/models/models.dart';

Future<void> main() async {
  final file = 'lib/new_test_data/Patient.ndjson';
  final fhirResources = await FhirBulk.fromFile(file);
  final senzingPersons = fhirResources
      .map((e) => jsonEncode(SenzingPerson.fromFhir(e as Patient).toJson()))
      .toList();
  if (!(await File(file.replaceAll('/Patient', 'SenzingPerson')).exists())) {
    await File(file.replaceAll('Patient', 'SenzingPerson')).create();
  }
  await File(file.replaceAll('Patient', 'SenzingPerson'))
      .writeAsString(senzingPersons.join('\n'));
}
