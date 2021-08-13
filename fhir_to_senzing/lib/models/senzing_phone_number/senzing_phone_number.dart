// ignore_for_file: invalid_annotation_target

import 'package:fhir/r4.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'senzing_phone_number.freezed.dart';
part 'senzing_phone_number.g.dart';
part 'senzing_phone_number.fhir.dart';

@freezed
class SenzingPhoneNumber with _$SenzingPhoneNumber {
  SenzingPhoneNumber._();

  factory SenzingPhoneNumber({
    @JsonKey(name: 'PHONE_TYPE') String? phoneType,
    @JsonKey(name: 'PHONE_NUMBER') String? phoneNumber,
    @JsonKey(name: 'PHONE_FROM_DATE') String? phoneFromDate,
    @JsonKey(name: 'PHONE_THRU_DATE') String? phoneThruDate,
  }) = _SenzingPhoneNumber;

  factory SenzingPhoneNumber.fromJson(Map<String, dynamic> json) =>
      _$SenzingPhoneNumberFromJson(json);

  factory SenzingPhoneNumber.fromFhir(ContactPoint contactPoint) =>
      _$SenzingPhoneNumberFromFhir(contactPoint);

  ContactPoint? toFhirContactPoint() => _$ToFhirContactPoint(this);
}
