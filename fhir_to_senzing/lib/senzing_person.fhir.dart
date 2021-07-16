part of 'senzing_person.dart';

SenzingPerson _$SenzingPersonFromFhir(Patient patient) {
  return SenzingPerson(
    dataSource: null,
    recordId: patient.id?.toString(),
    nameList: patient.name?.map((e) => SenzingName.fromFhir(e)).toList(),
    addressList:
        patient.address?.map((e) => SenzingAddress.fromFhir(e)).toList(),
    phoneList: patient.telecom
        ?.where((e) => e.system == ContactPointSystem.phone)
        .toList()
        .map((e) => SenzingPhoneNumber.fromFhir(e))
        .toList(),
    gender: patient.gender?.toString(),
    dateOfBirth: patient.birthDate?.toString(),
    dateOfDeath: patient.deceasedDateTime?.toString(),
    nationality: null,
    citizenship: null,
    placeOfBirth: null,
    recordType: null,
    registrationDate: null,
    registrationCountry: null,
    passportNumber: null,
    passportCountry: null,
    driversLicenseNumber: null,
    driversLicenseState: null,
    ssnNumber: null,
    ssnLast4: null,
    nationalIdNumber: null,
    nationalIdCountry: null,
    taxIdType: null,
    taxIdNumber: null,
    taxIdCountry: null,
    otherIdType: null,
    otherIdNumber: null,
    otherIdCountry: null,
    trustedIdType: null,
    trustedIdNumber: null,
    socialHandle: null,
    entityType: null,
    srccode: null,
    ccAccountNumber: null,
    accountNumber: null,
    dunsNumber: null,
    npiNumber: null,
    leiNumber: null,
    dsrcAction: null,
    entityid: null,
  );
}

Patient _$ToFhirPatient(SenzingPerson instance) => Patient(
      id: instance.recordId == null ? null : Id(instance.recordId!),
      name: instance.nameList?.map((e) => e.toFhirHumanName()).toList(),
      address: instance.addressList?.map((e) => e.toFhirAddress()).toList(),
      telecom: instance.phoneList?.map((e) => e.toFhirContactPoint()).toList(),
      gender: instance.gender == null
          ? null
          : instance.gender!.toLowerCase() == 'female'
              ? PatientGender.female
              : instance.gender!.toLowerCase() == 'male'
                  ? PatientGender.male
                  : PatientGender.other,
      birthDate:
          instance.dateOfBirth == null ? null : Date(instance.dateOfBirth),
      deceasedDateTime: instance.dateOfDeath == null
          ? null
          : FhirDateTime(instance.dateOfDeath),
    );

SenzingName _$SenzingNameFromFhir(HumanName humanName) => SenzingName(
      nameType: humanName.use?.toString(),
      nameFull: humanName.text,
      nameOrg: null,
      nameLast: humanName.family,
      nameFirst:
          humanName.given?.isNotEmpty ?? false ? humanName.given!.first : null,
      nameMiddle:
          humanName.given?.isNotEmpty ?? false ? humanName.given!.first : null,
      namePrefix: humanName.prefix?.isNotEmpty ?? false
          ? humanName.prefix!.first
          : null,
      nameSuffix: humanName.suffix?.isNotEmpty ?? false
          ? humanName.suffix!.first
          : null,
    );

HumanName _$ToFhirHumanName(SenzingName instance) {
  final givenList = <String>[];
  if (instance.nameFirst != null) {
    givenList.add(instance.nameFirst!);
  }
  if (instance.nameMiddle != null) {
    givenList.add(instance.nameMiddle!);
  }
  return HumanName(
    use: _$enumDecodeNullable(_$HumanNameUseEnumMap, instance.nameType),
    text: instance.nameFull,
    family: instance.nameLast,
    given: givenList,
    prefix: instance.namePrefix != null ? [instance.namePrefix!] : null,
    suffix: instance.nameSuffix != null ? [instance.nameSuffix!] : null,
  );
}

const _$HumanNameUseEnumMap = {
  HumanNameUse.usual: 'usual',
  HumanNameUse.official: 'official',
  HumanNameUse.temp: 'temp',
  HumanNameUse.nickname: 'nickname',
  HumanNameUse.anonymous: 'anonymous',
  HumanNameUse.old: 'old',
  HumanNameUse.maiden: 'maiden',
  HumanNameUse.unknown: 'unknown',
};

SenzingAddress _$SenzingAddressFromFhir(Address address) => SenzingAddress(
      addrType: address.use?.toString(),
      addrFull: address.text,
      addrLine1: address.line?.isNotEmpty ?? false ? address.line!.first : null,
      addrLine2: address.line == null
          ? null
          : address.line!.length > 1
              ? address.line![1]
              : null,
      addrLine3: address.line == null
          ? null
          : address.line!.length > 2
              ? address.line![2]
              : null,
      addrLine4: address.line == null
          ? null
          : address.line!.length > 3
              ? address.line![3]
              : null,
      addrLine5: address.line == null
          ? null
          : address.line!.length > 4
              ? address.line![4]
              : null,
      addrLine6: address.line == null
          ? null
          : address.line!.length > 5
              ? address.line![5]
              : null,
      addrCity: address.city,
      addrState: address.state,
      addrPostalCode: address.postalCode,
      addrCountry: address.country,
      addrFromDate: address.period?.start.toString(),
      addrThruDate: address.period?.end.toString(),
    );

Address _$ToFhirAddress(SenzingAddress instance) {
  final lineList = [];
  for (var addrLine in [
    instance.addrLine1,
    instance.addrLine2,
    instance.addrLine3,
    instance.addrLine4,
    instance.addrLine5,
    instance.addrLine6,
  ]) {
    if (addrLine != null) {
      lineList.add(addrLine);
    }
  }
  return Address.fromJson({
    'use': instance.addrType,
    'text': instance.addrFull,
    'line': lineList,
    'city': instance.addrCity,
    'state': instance.addrState,
    'postalCode': instance.addrPostalCode,
    'country': instance.addrCountry,
    'period': {
      'start': instance.addrFromDate,
      'end': instance.addrThruDate,
    }
  });
}

SenzingPhoneNumber _$SenzingPhoneNumberFromFhir(ContactPoint contactPoint) =>
    SenzingPhoneNumber(
      phoneType: contactPoint.use.toString(),
      phoneNumber: contactPoint.value,
      phoneFromDate: contactPoint.period?.start.toString(),
      phoneThruDate: contactPoint.period?.end.toString(),
    );

ContactPoint _$ToFhirContactPoint(SenzingPhoneNumber instance) =>
    ContactPoint.fromJson({
      'use': instance.phoneType,
      'value': instance.phoneNumber,
      'period': {
        'start': instance.phoneFromDate,
        'end': instance.phoneThruDate,
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

K? _$enumDecodeNullable<K, V>(
  Map<K, V> enumValues,
  dynamic source, {
  K? unknownValue,
}) {
  if (source == null) {
    return null;
  }
  return _$enumDecode<K, V>(enumValues, source, unknownValue: unknownValue);
}
