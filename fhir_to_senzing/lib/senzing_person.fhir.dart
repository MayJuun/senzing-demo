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
    gender: patient.gender == PatientGender.female
        ? 'Female'
        : patient.gender == PatientGender.male
            ? 'Male'
            : 'Other',
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

Patient _$ToFhirPatient(SenzingPerson instance) {
  /// Get the list of names, addresses & telecoms if they exist
  final List<HumanName> nameList = [];
  instance.nameList?.map((e) {
    if (e.toFhirHumanName() != null) {
      nameList.add(e.toFhirHumanName()!);
    }
  });
  final List<Address> addressList = [];
  instance.addressList?.map((e) {
    if (e.toFhirAddress() != null) {
      addressList.add(e.toFhirAddress()!);
    }
  });
  final List<ContactPoint> contactPointList = [];
  instance.phoneList?.map((e) {
    if (e.toFhirContactPoint() != null) {
      contactPointList.add(e.toFhirContactPoint()!);
    }
  });

  /// Get a single Name, Address or ContactPoint from SenzingPerson instance
  if (instance.toFhirHumanNameFromInstance() != null) {
    nameList.add(instance.toFhirHumanNameFromInstance()!);
  }
  if (instance.toFhirAddressFromInstance() != null) {
    addressList.add(instance.toFhirAddressFromInstance()!);
  }
  if (instance.toFhirContactPointFromInstance() != null) {
    contactPointList.add(instance.toFhirContactPointFromInstance()!);
  }

  return Patient(
    id: instance.recordId == null ? null : Id(instance.recordId!),

    /// Only include if name list is not empty
    name: nameList.isEmpty ? null : nameList,

    /// Only include if address list is not empty
    address: addressList.isEmpty ? null : addressList,

    /// Only include if ContactPoint list is not empty
    telecom: contactPointList.isEmpty ? null : contactPointList,
    gender: instance.gender == null
        ? null
        : instance.gender!.toLowerCase().contains('f')
            ? PatientGender.female
            : instance.gender!.toLowerCase().contains('m')
                ? PatientGender.male
                : PatientGender.other,
    birthDate: instance.dateOfBirth == null ? null : Date(instance.dateOfBirth),
    deceasedDateTime: instance.dateOfDeath == null
        ? null
        : FhirDateTime(instance.dateOfDeath),
  );
}

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

HumanName? _$ToFhirHumanNameFromInstance(SenzingPerson instance) =>
    _$ToFhirHumanName(instance);

HumanName? _$ToFhirHumanName(dynamic instance) {
  if (instance.nameFirst == null &&
      instance.nameMiddle == null &&
      instance.nameType == null &&
      instance.nameFull == null &&
      instance.nameLast == null &&
      instance.namePrefix == null &&
      instance.nameSuffix == null) {
    return null;
  } else {
    final givenList = <String>[];
    if (instance.nameFirst != null) {
      givenList.add(instance.nameFirst!);
    }
    if (instance.nameMiddle != null) {
      givenList.add(instance.nameMiddle!);
    }
    return HumanName(
      use: _$enumDecodeNullable(_$HumanNameUseEnumMap, instance.nameType),
      text: instance.nameFull ?? null,
      family: instance.nameLast ?? null,
      given: givenList.isEmpty ? null : givenList,
      prefix: instance.namePrefix != null ? [instance.namePrefix!] : null,
      suffix: instance.nameSuffix != null ? [instance.nameSuffix!] : null,
    );
  }
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
      addrFromDate: address.period?.start?.toString(),
      addrThruDate: address.period?.end?.toString(),
    );

Address? _$ToFhirAddressFromInstance(SenzingPerson instance) =>
    _$ToFhirAddress(instance);

Address? _$ToFhirAddress(dynamic instance) {
  if (instance.addrLine1 == null &&
      instance.addrLine2 == null &&
      instance.addrLine3 == null &&
      instance.addrLine4 == null &&
      instance.addrLine5 == null &&
      instance.addrLine6 == null &&
      instance.addrType == null &&
      instance.addrFull == null &&
      instance.addrCity == null &&
      instance.addrState == null &&
      instance.addrPostalCode == null &&
      instance.addrCountry == null &&
      instance.addrFromDate == null &&
      instance.addrThruDate == null) {
    return null;
  } else {
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
      'use': instance.addrType ?? null,
      'text': instance.addrFull ?? null,
      'line': lineList,
      'city': instance.addrCity ?? null,
      'state': instance.addrState ?? null,
      'postalCode': instance.addrPostalCode ?? null,
      'country': instance.addrCountry ?? null,
      'period': instance.addrFromDate == null && instance.addrThruDate == null
          ? null
          : {
              'start': instance.addrFromDate ?? null,
              'end': instance.addrThruDate ?? null,
            }
    });
  }
}

SenzingPhoneNumber _$SenzingPhoneNumberFromFhir(ContactPoint contactPoint) =>
    SenzingPhoneNumber(
      phoneType: contactPoint.use?.toString(),
      phoneNumber: contactPoint.value,
      phoneFromDate: contactPoint.period?.start?.toString(),
      phoneThruDate: contactPoint.period?.end?.toString(),
    );

ContactPoint? _$ToFhirContactPointFromInstance(SenzingPerson instance) =>
    _$ToFhirContactPoint(instance);

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
