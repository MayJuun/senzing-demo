part of 'senzing_name.dart';

SenzingName _$SenzingNameFromFhir(HumanName humanName) => SenzingName(
      nameType: humanName.use?.toString(),
      nameFull: humanName.text,
      nameOrg: null,
      nameLast: humanName.family,
      nameFirst:
          humanName.given?.isNotEmpty ?? false ? humanName.given!.first : null,
      nameMiddle: (humanName.given?.isNotEmpty ?? false) ||
              (humanName.given?.length ?? 0) <= 1
          ? null
          : humanName.given?[1],
      namePrefix: humanName.prefix?.isNotEmpty ?? false
          ? humanName.prefix!.first
          : null,
      nameSuffix: humanName.suffix?.isNotEmpty ?? false
          ? humanName.suffix!.first
          : null,
    );

HumanName? _$ToFhirHumanName(SenzingName instance) {
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
