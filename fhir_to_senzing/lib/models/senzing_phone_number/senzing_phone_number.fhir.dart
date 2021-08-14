part of 'senzing_phone_number.dart';

SenzingPhoneNumber _$SenzingPhoneNumberFromFhir(ContactPoint contactPoint) =>
    SenzingPhoneNumber(
      phoneType: contactPointUseToString(contactPoint.use),
      phoneNumber: contactPoint.value,
      phoneFromDate: contactPoint.period?.start?.toString(),
      phoneThruDate: contactPoint.period?.end?.toString(),
    );

String? contactPointUseToString(ContactPointUse? use) {
  if (use == null) {
    return null;
  } else if (use == ContactPointUse.home) {
    return 'home';
  } else if (use == ContactPointUse.work) {
    return 'work';
  } else if (use == ContactPointUse.mobile) {
    return 'mobile';
  } else if (use == ContactPointUse.temp) {
    return 'temp';
  } else if (use == ContactPointUse.old) {
    return 'old';
  } else {
    return null;
  }
}

ContactPoint? _$ToFhirContactPoint(SenzingPhoneNumber instance) =>
    instance.phoneType == null &&
            instance.phoneNumber == null &&
            instance.phoneFromDate == null &&
            instance.phoneThruDate == null
        ? null
        : ContactPoint.fromJson({
            'system': 'phone',
            'use': stringToContactPointUse(instance.phoneType),
            'value': instance.phoneNumber ?? null,
            'period':
                instance.phoneFromDate == null && instance.phoneThruDate == null
                    ? null
                    : {
                        'start': instance.phoneFromDate ?? null,
                        'end': instance.phoneThruDate ?? null,
                      }
          });

String? stringToContactPointUse(String? use) {
  if (use == null) {
    return null;
  } else if (use.toLowerCase().contains('home')) {
    return 'home';
  } else if (use.toLowerCase().contains('work')) {
    return 'work';
  } else if (use.toLowerCase().contains('mobile') ||
      use.toLowerCase().contains('cell')) {
    return 'mobile';
  } else if (use.toLowerCase().contains('temp')) {
    return 'temp';
  } else if (use.toLowerCase().contains('old')) {
    return 'old';
  } else {
    return null;
  }
}
