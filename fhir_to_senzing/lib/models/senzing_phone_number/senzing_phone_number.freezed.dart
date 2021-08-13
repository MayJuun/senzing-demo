// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'senzing_phone_number.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SenzingPhoneNumber _$SenzingPhoneNumberFromJson(Map<String, dynamic> json) {
  return _SenzingPhoneNumber.fromJson(json);
}

/// @nodoc
class _$SenzingPhoneNumberTearOff {
  const _$SenzingPhoneNumberTearOff();

  _SenzingPhoneNumber call(
      {@JsonKey(name: 'PHONE_TYPE') String? phoneType,
      @JsonKey(name: 'PHONE_NUMBER') String? phoneNumber,
      @JsonKey(name: 'PHONE_FROM_DATE') String? phoneFromDate,
      @JsonKey(name: 'PHONE_THRU_DATE') String? phoneThruDate}) {
    return _SenzingPhoneNumber(
      phoneType: phoneType,
      phoneNumber: phoneNumber,
      phoneFromDate: phoneFromDate,
      phoneThruDate: phoneThruDate,
    );
  }

  SenzingPhoneNumber fromJson(Map<String, Object> json) {
    return SenzingPhoneNumber.fromJson(json);
  }
}

/// @nodoc
const $SenzingPhoneNumber = _$SenzingPhoneNumberTearOff();

/// @nodoc
mixin _$SenzingPhoneNumber {
  @JsonKey(name: 'PHONE_TYPE')
  String? get phoneType => throw _privateConstructorUsedError;
  @JsonKey(name: 'PHONE_NUMBER')
  String? get phoneNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'PHONE_FROM_DATE')
  String? get phoneFromDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'PHONE_THRU_DATE')
  String? get phoneThruDate => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SenzingPhoneNumberCopyWith<SenzingPhoneNumber> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SenzingPhoneNumberCopyWith<$Res> {
  factory $SenzingPhoneNumberCopyWith(
          SenzingPhoneNumber value, $Res Function(SenzingPhoneNumber) then) =
      _$SenzingPhoneNumberCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'PHONE_TYPE') String? phoneType,
      @JsonKey(name: 'PHONE_NUMBER') String? phoneNumber,
      @JsonKey(name: 'PHONE_FROM_DATE') String? phoneFromDate,
      @JsonKey(name: 'PHONE_THRU_DATE') String? phoneThruDate});
}

/// @nodoc
class _$SenzingPhoneNumberCopyWithImpl<$Res>
    implements $SenzingPhoneNumberCopyWith<$Res> {
  _$SenzingPhoneNumberCopyWithImpl(this._value, this._then);

  final SenzingPhoneNumber _value;
  // ignore: unused_field
  final $Res Function(SenzingPhoneNumber) _then;

  @override
  $Res call({
    Object? phoneType = freezed,
    Object? phoneNumber = freezed,
    Object? phoneFromDate = freezed,
    Object? phoneThruDate = freezed,
  }) {
    return _then(_value.copyWith(
      phoneType: phoneType == freezed
          ? _value.phoneType
          : phoneType // ignore: cast_nullable_to_non_nullable
              as String?,
      phoneNumber: phoneNumber == freezed
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      phoneFromDate: phoneFromDate == freezed
          ? _value.phoneFromDate
          : phoneFromDate // ignore: cast_nullable_to_non_nullable
              as String?,
      phoneThruDate: phoneThruDate == freezed
          ? _value.phoneThruDate
          : phoneThruDate // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$SenzingPhoneNumberCopyWith<$Res>
    implements $SenzingPhoneNumberCopyWith<$Res> {
  factory _$SenzingPhoneNumberCopyWith(
          _SenzingPhoneNumber value, $Res Function(_SenzingPhoneNumber) then) =
      __$SenzingPhoneNumberCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'PHONE_TYPE') String? phoneType,
      @JsonKey(name: 'PHONE_NUMBER') String? phoneNumber,
      @JsonKey(name: 'PHONE_FROM_DATE') String? phoneFromDate,
      @JsonKey(name: 'PHONE_THRU_DATE') String? phoneThruDate});
}

/// @nodoc
class __$SenzingPhoneNumberCopyWithImpl<$Res>
    extends _$SenzingPhoneNumberCopyWithImpl<$Res>
    implements _$SenzingPhoneNumberCopyWith<$Res> {
  __$SenzingPhoneNumberCopyWithImpl(
      _SenzingPhoneNumber _value, $Res Function(_SenzingPhoneNumber) _then)
      : super(_value, (v) => _then(v as _SenzingPhoneNumber));

  @override
  _SenzingPhoneNumber get _value => super._value as _SenzingPhoneNumber;

  @override
  $Res call({
    Object? phoneType = freezed,
    Object? phoneNumber = freezed,
    Object? phoneFromDate = freezed,
    Object? phoneThruDate = freezed,
  }) {
    return _then(_SenzingPhoneNumber(
      phoneType: phoneType == freezed
          ? _value.phoneType
          : phoneType // ignore: cast_nullable_to_non_nullable
              as String?,
      phoneNumber: phoneNumber == freezed
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      phoneFromDate: phoneFromDate == freezed
          ? _value.phoneFromDate
          : phoneFromDate // ignore: cast_nullable_to_non_nullable
              as String?,
      phoneThruDate: phoneThruDate == freezed
          ? _value.phoneThruDate
          : phoneThruDate // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_SenzingPhoneNumber extends _SenzingPhoneNumber {
  _$_SenzingPhoneNumber(
      {@JsonKey(name: 'PHONE_TYPE') this.phoneType,
      @JsonKey(name: 'PHONE_NUMBER') this.phoneNumber,
      @JsonKey(name: 'PHONE_FROM_DATE') this.phoneFromDate,
      @JsonKey(name: 'PHONE_THRU_DATE') this.phoneThruDate})
      : super._();

  factory _$_SenzingPhoneNumber.fromJson(Map<String, dynamic> json) =>
      _$_$_SenzingPhoneNumberFromJson(json);

  @override
  @JsonKey(name: 'PHONE_TYPE')
  final String? phoneType;
  @override
  @JsonKey(name: 'PHONE_NUMBER')
  final String? phoneNumber;
  @override
  @JsonKey(name: 'PHONE_FROM_DATE')
  final String? phoneFromDate;
  @override
  @JsonKey(name: 'PHONE_THRU_DATE')
  final String? phoneThruDate;

  @override
  String toString() {
    return 'SenzingPhoneNumber(phoneType: $phoneType, phoneNumber: $phoneNumber, phoneFromDate: $phoneFromDate, phoneThruDate: $phoneThruDate)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _SenzingPhoneNumber &&
            (identical(other.phoneType, phoneType) ||
                const DeepCollectionEquality()
                    .equals(other.phoneType, phoneType)) &&
            (identical(other.phoneNumber, phoneNumber) ||
                const DeepCollectionEquality()
                    .equals(other.phoneNumber, phoneNumber)) &&
            (identical(other.phoneFromDate, phoneFromDate) ||
                const DeepCollectionEquality()
                    .equals(other.phoneFromDate, phoneFromDate)) &&
            (identical(other.phoneThruDate, phoneThruDate) ||
                const DeepCollectionEquality()
                    .equals(other.phoneThruDate, phoneThruDate)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(phoneType) ^
      const DeepCollectionEquality().hash(phoneNumber) ^
      const DeepCollectionEquality().hash(phoneFromDate) ^
      const DeepCollectionEquality().hash(phoneThruDate);

  @JsonKey(ignore: true)
  @override
  _$SenzingPhoneNumberCopyWith<_SenzingPhoneNumber> get copyWith =>
      __$SenzingPhoneNumberCopyWithImpl<_SenzingPhoneNumber>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_SenzingPhoneNumberToJson(this);
  }
}

abstract class _SenzingPhoneNumber extends SenzingPhoneNumber {
  factory _SenzingPhoneNumber(
          {@JsonKey(name: 'PHONE_TYPE') String? phoneType,
          @JsonKey(name: 'PHONE_NUMBER') String? phoneNumber,
          @JsonKey(name: 'PHONE_FROM_DATE') String? phoneFromDate,
          @JsonKey(name: 'PHONE_THRU_DATE') String? phoneThruDate}) =
      _$_SenzingPhoneNumber;
  _SenzingPhoneNumber._() : super._();

  factory _SenzingPhoneNumber.fromJson(Map<String, dynamic> json) =
      _$_SenzingPhoneNumber.fromJson;

  @override
  @JsonKey(name: 'PHONE_TYPE')
  String? get phoneType => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'PHONE_NUMBER')
  String? get phoneNumber => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'PHONE_FROM_DATE')
  String? get phoneFromDate => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'PHONE_THRU_DATE')
  String? get phoneThruDate => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$SenzingPhoneNumberCopyWith<_SenzingPhoneNumber> get copyWith =>
      throw _privateConstructorUsedError;
}
