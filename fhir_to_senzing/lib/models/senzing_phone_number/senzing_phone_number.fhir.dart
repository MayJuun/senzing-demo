part of 'senzing_phone_number.dart';

SenzingPhoneNumber _$SenzingPhoneNumberFromFhir(ContactPoint contactPoint) =>
    SenzingPhoneNumber(
      phoneType: contactPoint.use?.toString(),
      phoneNumber: contactPoint.value,
      phoneFromDate: contactPoint.period?.start?.toString(),
      phoneThruDate: contactPoint.period?.end?.toString(),
    );

ContactPoint? _$ToFhirContactPoint(dynamic instance) =>
    instance.phoneType == null &&
            instance.phoneNumber == null &&
            instance.phoneFromDate == null &&
            instance.phoneThruDate == null
        ? null
        : ContactPoint.fromJson({
            'system': 'phone',
            'use': instance.phoneType ?? null,
            'value': instance.phoneNumber ?? null,
            'period':
                instance.phoneFromDate == null && instance.phoneThruDate == null
                    ? null
                    : {
                        'start': instance.phoneFromDate ?? null,
                        'end': instance.phoneThruDate ?? null,
                      }
          });

K _$enumDecode<K, V>(
  Map<K, V> enumValues,
  Object? source, {
  K? unknownValue,
}) {
  if (source == null) {
    throw ArgumentError(
      'A value must be provided. Supported values: '
      '${enumValues.values.join(', ')}',
    );
  }

  return enumValues.entries.singleWhere(
    (e) => e.value == source,
    orElse: () {
      if (unknownValue == null) {
        throw ArgumentError(
          '`$source` is not one of the supported values: '
          '${enumValues.values.join(', ')}',
        );
      }
      return MapEntry(unknownValue, enumValues.values.first);
    },
  ).key;
}
