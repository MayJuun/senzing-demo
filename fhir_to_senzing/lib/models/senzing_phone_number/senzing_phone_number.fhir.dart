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
