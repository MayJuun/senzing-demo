// ignore_for_file: invalid_annotation_target

import 'package:fhir/r4.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../models.dart';
import 'country_codes.dart';
import 'state_license.dart';

part 'senzing_person.freezed.dart';
part 'senzing_person.g.dart';
part 'senzing_person.fhir.dart';

/// Immutable freezed class representing the json serialization/deserialization
/// of a Person in Senzing (not all fields currently available)
@freezed
class SenzingPerson with _$SenzingPerson {
  SenzingPerson._();

  factory SenzingPerson({
    @JsonKey(name: 'DATA_SOURCE') String? dataSource,
    @JsonKey(name: 'RECORD_ID') String? recordId,
    @JsonKey(name: 'NAME_LIST') List<SenzingName>? nameList,
    @JsonKey(name: 'NAME_TYPE') String? nameType,
    @JsonKey(name: 'NAME_FULL') String? nameFull,
    @JsonKey(name: 'NAME_ORG') String? nameOrg,
    @JsonKey(name: 'NAME_LAST') String? nameLast,
    @JsonKey(name: 'NAME_FIRST') String? nameFirst,
    @JsonKey(name: 'NAME_MIDDLE') String? nameMiddle,
    @JsonKey(name: 'NAME_PREFIX') String? namePrefix,
    @JsonKey(name: 'NAME_SUFFIX') String? nameSuffix,
    @JsonKey(name: 'ADDRESS_LIST') List<SenzingAddress>? addressList,
    @JsonKey(name: 'ADDR_TYPE') String? addrType,
    @JsonKey(name: 'ADDR_FULL') String? addrFull,
    @JsonKey(name: 'ADDR_LINE1') String? addrLine1,
    @JsonKey(name: 'ADDR_LINE2') String? addrLine2,
    @JsonKey(name: 'ADDR_LINE3') String? addrLine3,
    @JsonKey(name: 'ADDR_LINE4') String? addrLine4,
    @JsonKey(name: 'ADDR_LINE5') String? addrLine5,
    @JsonKey(name: 'ADDR_LINE6') String? addrLine6,
    @JsonKey(name: 'ADDR_CITY') String? addrCity,
    @JsonKey(name: 'ADDR_STATE') String? addrState,
    @JsonKey(name: 'ADDR_POSTAL_CODE') String? addrPostalCode,
    @JsonKey(name: 'ADDR_COUNTRY') String? addrCountry,
    @JsonKey(name: 'ADDR_FROM_DATE') String? addrFromDate,
    @JsonKey(name: 'ADDR_THRU_DATE') String? addrThruDate,
    @JsonKey(name: 'PHONE_LIST') List<SenzingPhoneNumber>? phoneList,
    @JsonKey(name: 'PHONE_TYPE') String? phoneType,
    @JsonKey(name: 'PHONE_NUMBER') String? phoneNumber,
    @JsonKey(name: 'PHONE_FROM_DATE') String? phoneFromDate,
    @JsonKey(name: 'PHONE_THRU_DATE') String? phoneThruDate,
    @JsonKey(name: 'GENDER') String? gender,
    @JsonKey(name: 'DATE_OF_BIRTH') String? dateOfBirth,
    @JsonKey(name: 'DATE_OF_DEATH') String? dateOfDeath,
    @JsonKey(name: 'NATIONALITY') String? nationality,
    @JsonKey(name: 'CITIZENSHIP') String? citizenship,
    @JsonKey(name: 'PLACE_OF_BIRTH') String? placeOfBirth,
    @JsonKey(name: 'RECORD_TYPE') String? recordType,
    @JsonKey(name: 'REGISTRATION_DATE') String? registrationDate,
    @JsonKey(name: 'REGISTRATION_COUNTRY') String? registrationCountry,
    @JsonKey(name: 'PASSPORT_NUMBER') String? passportNumber,
    @JsonKey(name: 'PASSPORT_COUNTRY') String? passportCountry,
    @JsonKey(name: 'DRIVERS_LICENSE_NUMBER') String? driversLicenseNumber,
    @JsonKey(name: 'DRIVERS_LICENSE_STATE') String? driversLicenseState,
    @JsonKey(name: 'SSN_NUMBER') String? ssnNumber,
    @JsonKey(name: 'SSN_LAST4') String? ssnLast4,
    @JsonKey(name: 'NATIONAL_ID_NUMBER') String? nationalIdNumber,
    @JsonKey(name: 'NATIONAL_ID_COUNTRY') String? nationalIdCountry,
    @JsonKey(name: 'TAX_ID_TYPE') String? taxIdType,
    @JsonKey(name: 'TAX_ID_NUMBER') String? taxIdNumber,
    @JsonKey(name: 'TAX_ID_COUNTRY') String? taxIdCountry,
    @JsonKey(name: 'OTHER_ID_TYPE') String? otherIdType,
    @JsonKey(name: 'OTHER_ID_NUMBER') String? otherIdNumber,
    @JsonKey(name: 'OTHER_ID_COUNTRY') String? otherIdCountry,
    @JsonKey(name: 'TRUSTED_ID_TYPE') String? trustedIdType,
    @JsonKey(name: 'TRUSTED_ID_NUMBER') String? trustedIdNumber,
    @JsonKey(name: 'SOCIAL_HANDLE') String? socialHandle,
    @JsonKey(name: 'ENTITY_TYPE') String? entityType,
    @JsonKey(name: 'srccode') String? srccode,
    @JsonKey(name: 'CC_ACCOUNT_NUMBER') String? ccAccountNumber,
    @JsonKey(name: 'ACCOUNT_NUMBER') String? accountNumber,
    @JsonKey(name: 'DUNS_NUMBER') String? dunsNumber,
    @JsonKey(name: 'NPI_NUMBER') String? npiNumber,
    @JsonKey(name: 'LEI_NUMBER') String? leiNumber,
    @JsonKey(name: 'DSRC_ACTION') String? dsrcAction,
    @JsonKey(name: 'entityid') String? entityid,
  }) = _SenzingPerson;

  /// Constructor for creating a Senzing person from a json Map
  factory SenzingPerson.fromJson(Map<String, dynamic> json) =>
      _$SenzingPersonFromJson(json);

  /// Constructor for creating a Senzing person from a FHIR Patient
  factory SenzingPerson.fromFhir(Patient patient) =>
      _$SenzingPersonFromFhir(patient);

  /// Method to create a FHIR Patient from this instance of a Senzing Person
  Patient? toFhirPatient() => _$ToFhirPatient(this);

  /// Method to Create a single HumanName from this instance of a Senzing
  /// Person (note, this is not the method that returns a list of HumanNames
  /// if they exist, that is done in the SenzingName Class)
  HumanName? toFhirHumanNameFromInstance() => _$ToFhirHumanName(this);

  /// Method to Create a single Address from this instance of a Senzing
  /// Person (note, this is not the method that returns a list of Addresses
  /// if they exist, that is done in the SenzingAddress Class)
  Address? toFhirAddressFromInstance() => _$ToFhirAddress(this);

  /// Method to Create a single ContactPoint from this instance of a Senzing
  /// Person (note, this is not the method that returns a list of ContactPoints
  /// if they exist, that is done in the SenzingPhoneNumber Class)
  ContactPoint? toFhirContactPointFromInstance() => _$ToFhirContactPoint(this);
}
