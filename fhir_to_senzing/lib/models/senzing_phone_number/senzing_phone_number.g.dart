// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'senzing_phone_number.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SenzingPhoneNumber _$_$_SenzingPhoneNumberFromJson(
    Map<String, dynamic> json) {
  return _$_SenzingPhoneNumber(
    phoneType: json['PHONE_TYPE'] as String?,
    phoneNumber: json['PHONE_NUMBER'] as String?,
    phoneFromDate: json['PHONE_FROM_DATE'] as String?,
    phoneThruDate: json['PHONE_THRU_DATE'] as String?,
  );
}

Map<String, dynamic> _$_$_SenzingPhoneNumberToJson(
    _$_SenzingPhoneNumber instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('PHONE_TYPE', instance.phoneType);
  writeNotNull('PHONE_NUMBER', instance.phoneNumber);
  writeNotNull('PHONE_FROM_DATE', instance.phoneFromDate);
  writeNotNull('PHONE_THRU_DATE', instance.phoneThruDate);
  return val;
}
