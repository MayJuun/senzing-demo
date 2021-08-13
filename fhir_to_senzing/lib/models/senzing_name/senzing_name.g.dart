// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'senzing_name.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SenzingName _$_$_SenzingNameFromJson(Map<String, dynamic> json) {
  return _$_SenzingName(
    nameType: json['NAME_TYPE'] as String?,
    nameFull: json['NAME_FULL'] as String?,
    nameOrg: json['NAME_ORG'] as String?,
    nameLast: json['NAME_LAST'] as String?,
    nameFirst: json['NAME_FIRST'] as String?,
    nameMiddle: json['NAME_MIDDLE'] as String?,
    namePrefix: json['NAME_PREFIX'] as String?,
    nameSuffix: json['NAME_SUFFIX'] as String?,
  );
}

Map<String, dynamic> _$_$_SenzingNameToJson(_$_SenzingName instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('NAME_TYPE', instance.nameType);
  writeNotNull('NAME_FULL', instance.nameFull);
  writeNotNull('NAME_ORG', instance.nameOrg);
  writeNotNull('NAME_LAST', instance.nameLast);
  writeNotNull('NAME_FIRST', instance.nameFirst);
  writeNotNull('NAME_MIDDLE', instance.nameMiddle);
  writeNotNull('NAME_PREFIX', instance.namePrefix);
  writeNotNull('NAME_SUFFIX', instance.nameSuffix);
  return val;
}
