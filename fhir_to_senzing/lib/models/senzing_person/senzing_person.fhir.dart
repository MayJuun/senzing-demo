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
            : 'N/A',
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

Identifier? _passportIdentifier(SenzingPerson instance) => instance
                .passportNumber ==
            null &&
        instance.passportCountry == null
    ? null
    : Identifier(
        type: CodeableConcept(coding: [
          Coding(
              system: FhirUri('http://terminology.hl7.org/CodeSystem/v2-0203'),
              code: Code('PPN'),
              display: 'Passport Number'),
        ]),
        system: instance.passportCountry == null ||
                (instance.passportCountry!.length != 2 &&
                    instance.passportCountry!.length != 3)
            ? null
            : FhirUri('http://hl7.org/fhir/sid/passport-' +
                (instance.passportCountry!.length == 3
                    ? instance.passportCountry!.toLowerCase()
                    : countryCodes[instance.passportCountry!.toLowerCase()] ??
                        '')),
        value: instance.passportNumber,
      );

Identifier? _driversLicenseIdentifier(SenzingPerson instance) => instance
                .driversLicenseNumber ==
            null &&
        instance.driversLicenseState == null
    ? null
    : Identifier(
        type: CodeableConcept(coding: [
          Coding(
              system: FhirUri('http://terminology.hl7.org/CodeSystem/v2-0203'),
              code: Code('DL'),
              display: 'Driver\'s license number'),
        ]),
        system: instance.driversLicenseState == null ||
                licenseStateToUri[
                        instance.driversLicenseState!.toUpperCase()] ==
                    null
            ? null
            : FhirUri(
                licenseStateToUri[instance.driversLicenseState!.toUpperCase()]),
        value: instance.driversLicenseNumber,
      );

Identifier? _ssnIdentifier(SenzingPerson instance) =>
    instance.ssnNumber == null && instance.ssnLast4 == null
        ? null
        : Identifier(
            type: CodeableConcept(coding: [
              Coding(
                  system:
                      FhirUri('http://terminology.hl7.org/CodeSystem/v2-0203'),
                  code: Code('SS'),
                  display: 'Social Security number'),
            ]),
            system: FhirUri('http://hl7.org/fhir/sid/us-ssn'),
            value: instance.taxIdNumber,
          );

Identifier? _taxIdIdentifier(SenzingPerson instance) => instance.taxIdNumber ==
            null &&
        instance.taxIdCountry == null &&
        instance.taxIdType == null
    ? null
    : Identifier(
        type: CodeableConcept(coding: [
          Coding(
              system: FhirUri('http://terminology.hl7.org/CodeSystem/v2-0203'),
              code: Code('TAX'),
              display: 'Tax ID number'),
        ]),
        system: instance.taxIdCountry == null ||
                (instance.taxIdCountry!.length != 2 &&
                    instance.taxIdCountry!.length != 3)
            ? null
            : FhirUri('http://hl7.org/fhir/sid/taxid-' +
                (instance.taxIdCountry!.length == 3
                    ? instance.taxIdCountry!.toLowerCase()
                    : countryCodes[instance.taxIdCountry!.toLowerCase()] ??
                        '')),
        value: instance.taxIdNumber,
      );

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

  final List<Identifier> identifierList = <Identifier>[];
  [
    _passportIdentifier,
    _driversLicenseIdentifier,
    _ssnIdentifier,
    _taxIdIdentifier
  ].forEach((fxn) {
    final newIdentifier = fxn(instance);
    if (newIdentifier != null) {
      identifierList.add(newIdentifier);
    }
  });

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

HumanName? _$ToFhirHumanName(SenzingPerson instance) {
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

Address? _$ToFhirAddress(SenzingPerson instance) {
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

ContactPoint? _$ToFhirContactPoint(SenzingPerson instance) =>
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
