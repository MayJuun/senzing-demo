// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'senzing_address.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SenzingAddress _$_$_SenzingAddressFromJson(Map<String, dynamic> json) {
  return _$_SenzingAddress(
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
  );
}

Map<String, dynamic> _$_$_SenzingAddressToJson(_$_SenzingAddress instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

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
  return val;
}
