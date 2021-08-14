part of 'senzing_address.dart';

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

String? addressUseToType(AddressUse? use) {
  if (use == null) {
    return null;
  } else if (use == AddressUse.home) {
    return 'home';
  } else if (use == AddressUse.work) {
    return 'work';
  } else if (use == AddressUse.temp) {
    return 'temp';
  } else if (use == AddressUse.old) {
    return 'old';
  } else if (use == AddressUse.billing) {
    return 'bill';
  } else {
    return null;
  }
}

Address? _$ToFhirAddress(SenzingAddress instance) {
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

String? addressTypeToUse(String? type) {
  if (type == null) {
    return null;
  } else if (type.toLowerCase().contains('home')) {
    return 'home';
  } else if (type.toLowerCase().contains('work')) {
    return 'work';
  } else if (type.toLowerCase().contains('temp')) {
    return 'temp';
  } else if (type.toLowerCase().contains('old')) {
    return 'old';
  } else if (type.toLowerCase().contains('bill')) {
    return 'bill';
  } else {
    return null;
  }
}
