import 'dart:convert';
import 'dart:io';

import 'package:fhir/r4.dart';
import 'package:fhir_bulk/r4/from_bulk.dart';
import 'package:fhir_to_senzing/models/models.dart';

/// fhir_1a/senzing_1a and fhir_1b/senzing_1b have their final patient in common
/// fhir 2a/senzing_2a and fhir_2b/senzing_2b have the last 50 patients in common

Future<void> main() async {
  var dir = Directory('lib/test_data');
  final fileList = await dir.list().map((event) => event.path).toList();
  for (var file in fileList) {
    if (file.contains('fhir')) {
      final fhirResources = await FhirBulk.fromFile(file);
      final senzingPersons = fhirResources
          .map((e) => jsonEncode(SenzingPerson.fromFhir(e as Patient).toJson()))
          .toList();
      if (!(await File(file.replaceAll('fhir', 'senzing')).exists())) {
        await File(file.replaceAll('fhir', 'senzing')).create();
      }
      await File(file.replaceAll('fhir', 'senzing'))
          .writeAsString(senzingPersons.join('\n'));
    }
  }
}
