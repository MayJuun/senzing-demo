// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'senzing_person.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SenzingPerson _$_$_SenzingPersonFromJson(Map<String, dynamic> json) {
  return _$_SenzingPerson(
    dataSource: json['DATA_SOURCE'] as String?,
    recordId: json['RECORD_ID'] as String?,
    nameList: (json['NAME_LIST'] as List<dynamic>?)
        ?.map((e) => SenzingName.fromJson(e as Map<String, dynamic>))
        .toList(),
    nameType: json['NAME_TYPE'] as String?,
    nameFull: json['NAME_FULL'] as String?,
    nameOrg: json['NAME_ORG'] as String?,
    nameLast: json['NAME_LAST'] as String?,
    nameFirst: json['NAME_FIRST'] as String?,
    nameMiddle: json['NAME_MIDDLE'] as String?,
    namePrefix: json['NAME_PREFIX'] as String?,
    nameSuffix: json['NAME_SUFFIX'] as String?,
    addressList: (json['ADDRESS_LIST'] as List<dynamic>?)
        ?.map((e) => SenzingAddress.fromJson(e as Map<String, dynamic>))
        .toList(),
    addrType: json['ADDR_TYPE'] as String?,
    addrFull: json['ADDR_FULL'] as String?,
    addrLine1: json['ADDR_LINE1'] as String?,
    addrLine2: json['ADDR_LINE2'] as String?,
    addrLine3: json['ADDR_LINE3'] as String?,
    addrLine4: json['ADDR_LINE4'] as String?,
    addrLine5: json['ADDR_LINE5'] as String?,
    addrLine6: json['ADDR_LINE6'] as String?,
    addrCity: json['ADDR_CITY'] as String?,
    addrState: json['ADDR_STATE'] as String?,
    addrPostalCode: json['ADDR_POSTAL_CODE'] as String?,
    addrCountry: json['ADDR_COUNTRY'] as String?,
    addrFromDate: json['ADDR_FROM_DATE'] as String?,
    addrThruDate: json['ADDR_THRU_DATE'] as String?,
    phoneList: (json['PHONE_LIST'] as List<dynamic>?)
        ?.map((e) => SenzingPhoneNumber.fromJson(e as Map<String, dynamic>))
        .toList(),
    phoneType: json['PHONE_TYPE'] as String?,
    phoneNumber: json['PHONE_NUMBER'] as String?,
    phoneFromDate: json['PHONE_FROM_DATE'] as String?,
    phoneThruDate: json['PHONE_THRU_DATE'] as String?,
    gender: json['GENDER'] as String?,
    dateOfBirth: json['DATE_OF_BIRTH'] as String?,
    dateOfDeath: json['DATE_OF_DEATH'] as String?,
    nationality: json['NATIONALITY'] as String?,
    citizenship: json['CITIZENSHIP'] as String?,
    placeOfBirth: json['PLACE_OF_BIRTH'] as String?,
    recordType: json['RECORD_TYPE'] as String?,
    registrationDate: json['REGISTRATION_DATE'] as String?,
    registrationCountry: json['REGISTRATION_COUNTRY'] as String?,
    passportNumber: json['PASSPORT_NUMBER'] as String?,
    passportCountry: json['PASSPORT_COUNTRY'] as String?,
    driversLicenseNumber: json['DRIVERS_LICENSE_NUMBER'] as String?,
    driversLicenseState: json['DRIVERS_LICENSE_STATE'] as String?,
    ssnNumber: json['SSN_NUMBER'] as String?,
    ssnLast4: json['SSN_LAST4'] as String?,
    nationalIdNumber: json['NATIONAL_ID_NUMBER'] as String?,
    nationalIdCountry: json['NATIONAL_ID_COUNTRY'] as String?,
    taxIdType: json['TAX_ID_TYPE'] as String?,
    taxIdNumber: json['TAX_ID_NUMBER'] as String?,
    taxIdCountry: json['TAX_ID_COUNTRY'] as String?,
    otherIdType: json['OTHER_ID_TYPE'] as String?,
    otherIdNumber: json['OTHER_ID_NUMBER'] as String?,
    otherIdCountry: json['OTHER_ID_COUNTRY'] as String?,
    trustedIdType: json['TRUSTED_ID_TYPE'] as String?,
    trustedIdNumber: json['TRUSTED_ID_NUMBER'] as String?,
    socialHandle: json['SOCIAL_HANDLE'] as String?,
    entityType: json['ENTITY_TYPE'] as String?,
    srccode: json['srccode'] as String?,
    ccAccountNumber: json['CC_ACCOUNT_NUMBER'] as String?,
    accountNumber: json['ACCOUNT_NUMBER'] as String?,
    dunsNumber: json['DUNS_NUMBER'] as String?,
    npiNumber: json['NPI_NUMBER'] as String?,
    leiNumber: json['LEI_NUMBER'] as String?,
    dsrcAction: json['DSRC_ACTION'] as String?,
    entityid: json['entityid'] as String?,
  );
}

Map<String, dynamic> _$_$_SenzingPersonToJson(_$_SenzingPerson instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('DATA_SOURCE', instance.dataSource);
  writeNotNull('RECORD_ID', instance.recordId);
  writeNotNull('NAME_LIST', instance.nameList?.map((e) => e.toJson()).toList());
  writeNotNull('NAME_TYPE', instance.nameType);
  writeNotNull('NAME_FULL', instance.nameFull);
  writeNotNull('NAME_ORG', instance.nameOrg);
  writeNotNull('NAME_LAST', instance.nameLast);
  writeNotNull('NAME_FIRST', instance.nameFirst);
  writeNotNull('NAME_MIDDLE', instance.nameMiddle);
  writeNotNull('NAME_PREFIX', instance.namePrefix);
  writeNotNull('NAME_SUFFIX', instance.nameSuffix);
  writeNotNull(
      'ADDRESS_LIST', instance.addressList?.map((e) => e.toJson()).toList());
  writeNotNull('ADDR_TYPE', instance.addrType);
  writeNotNull('ADDR_FULL', instance.addrFull);
  writeNotNull('ADDR_LINE1', instance.addrLine1);
  writeNotNull('ADDR_LINE2', instance.addrLine2);
  writeNotNull('ADDR_LINE3', instance.addrLine3);
  writeNotNull('ADDR_LINE4', instance.addrLine4);
  writeNotNull('ADDR_LINE5', instance.addrLine5);
  writeNotNull('ADDR_LINE6', instance.addrLine6);
  writeNotNull('ADDR_CITY', instance.addrCity);
  writeNotNull('ADDR_STATE', instance.addrState);
  writeNotNull('ADDR_POSTAL_CODE', instance.addrPostalCode);
  writeNotNull('ADDR_COUNTRY', instance.addrCountry);
  writeNotNull('ADDR_FROM_DATE', instance.addrFromDate);
  writeNotNull('ADDR_THRU_DATE', instance.addrThruDate);
  writeNotNull(
      'PHONE_LIST', instance.phoneList?.map((e) => e.toJson()).toList());
  writeNotNull('PHONE_TYPE', instance.phoneType);
  writeNotNull('PHONE_NUMBER', instance.phoneNumber);
  writeNotNull('PHONE_FROM_DATE', instance.phoneFromDate);
  writeNotNull('PHONE_THRU_DATE', instance.phoneThruDate);
  writeNotNull('GENDER', instance.gender);
  writeNotNull('DATE_OF_BIRTH', instance.dateOfBirth);
  writeNotNull('DATE_OF_DEATH', instance.dateOfDeath);
  writeNotNull('NATIONALITY', instance.nationality);
  writeNotNull('CITIZENSHIP', instance.citizenship);
  writeNotNull('PLACE_OF_BIRTH', instance.placeOfBirth);
  writeNotNull('RECORD_TYPE', instance.recordType);
  writeNotNull('REGISTRATION_DATE', instance.registrationDate);
  writeNotNull('REGISTRATION_COUNTRY', instance.registrationCountry);
  writeNotNull('PASSPORT_NUMBER', instance.passportNumber);
  writeNotNull('PASSPORT_COUNTRY', instance.passportCountry);
  writeNotNull('DRIVERS_LICENSE_NUMBER', instance.driversLicenseNumber);
  writeNotNull('DRIVERS_LICENSE_STATE', instance.driversLicenseState);
  writeNotNull('SSN_NUMBER', instance.ssnNumber);
  writeNotNull('SSN_LAST4', instance.ssnLast4);
  writeNotNull('NATIONAL_ID_NUMBER', instance.nationalIdNumber);
  writeNotNull('NATIONAL_ID_COUNTRY', instance.nationalIdCountry);
  writeNotNull('TAX_ID_TYPE', instance.taxIdType);
  writeNotNull('TAX_ID_NUMBER', instance.taxIdNumber);
  writeNotNull('TAX_ID_COUNTRY', instance.taxIdCountry);
  writeNotNull('OTHER_ID_TYPE', instance.otherIdType);
  writeNotNull('OTHER_ID_NUMBER', instance.otherIdNumber);
  writeNotNull('OTHER_ID_COUNTRY', instance.otherIdCountry);
  writeNotNull('TRUSTED_ID_TYPE', instance.trustedIdType);
  writeNotNull('TRUSTED_ID_NUMBER', instance.trustedIdNumber);
  writeNotNull('SOCIAL_HANDLE', instance.socialHandle);
  writeNotNull('ENTITY_TYPE', instance.entityType);
  writeNotNull('srccode', instance.srccode);
  writeNotNull('CC_ACCOUNT_NUMBER', instance.ccAccountNumber);
  writeNotNull('ACCOUNT_NUMBER', instance.accountNumber);
  writeNotNull('DUNS_NUMBER', instance.dunsNumber);
  writeNotNull('NPI_NUMBER', instance.npiNumber);
  writeNotNull('LEI_NUMBER', instance.leiNumber);
  writeNotNull('DSRC_ACTION', instance.dsrcAction);
  writeNotNull('entityid', instance.entityid);
  return val;
}
