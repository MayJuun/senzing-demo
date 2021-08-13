//ignore_for_file: invalid_annotation_target

import 'package:fhir/r4.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'senzing_address.freezed.dart';
part 'senzing_address.g.dart';
part 'senzing_address.fhir.dart';

@freezed
class SenzingAddress with _$SenzingAddress {
  SenzingAddress._();

  factory SenzingAddress({
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
  }) = _SenzingAddress;

  factory SenzingAddress.fromJson(Map<String, dynamic> json) =>
      _$SenzingAddressFromJson(json);

  factory SenzingAddress.fromFhir(Address address) =>
      _$SenzingAddressFromFhir(address);

  Address? toFhirAddress() => _$ToFhirAddress(this);
}
