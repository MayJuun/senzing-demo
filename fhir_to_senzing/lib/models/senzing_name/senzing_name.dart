// ignore_for_file: invalid_annotation_target

import 'package:fhir/r4.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'senzing_name.freezed.dart';
part 'senzing_name.g.dart';
part 'senzing_name.fhir.dart';

@freezed
class SenzingName with _$SenzingName {
  SenzingName._();

  factory SenzingName({
    @JsonKey(name: 'NAME_TYPE') String? nameType,
    @JsonKey(name: 'NAME_FULL') String? nameFull,
    @JsonKey(name: 'NAME_ORG') String? nameOrg,
    @JsonKey(name: 'NAME_LAST') String? nameLast,
    @JsonKey(name: 'NAME_FIRST') String? nameFirst,
    @JsonKey(name: 'NAME_MIDDLE') String? nameMiddle,
    @JsonKey(name: 'NAME_PREFIX') String? namePrefix,
    @JsonKey(name: 'NAME_SUFFIX') String? nameSuffix,
  }) = _SenzingName;

  factory SenzingName.fromJson(Map<String, dynamic> json) =>
      _$SenzingNameFromJson(json);

  factory SenzingName.fromFhir(HumanName humanName) =>
      _$SenzingNameFromFhir(humanName);

  HumanName? toFhirHumanName() => _$ToFhirHumanName(this);
}
