// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_struct.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<HomeStruct> _$homeStructSerializer = new _$HomeStructSerializer();

class _$HomeStructSerializer implements StructuredSerializer<HomeStruct> {
  @override
  final Iterable<Type> types = const [HomeStruct, _$HomeStruct];
  @override
  final String wireName = 'HomeStruct';

  @override
  Iterable<Object?> serialize(Serializers serializers, HomeStruct object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'firestoreUtilData',
      serializers.serialize(object.firestoreUtilData,
          specifiedType: const FullType(FirestoreUtilData)),
    ];
    Object? value;
    value = object.cityLocality;
    if (value != null) {
      result
        ..add('cityLocality')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.countryCode;
    if (value != null) {
      result
        ..add('countryCode')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.fullAddress;
    if (value != null) {
      result
        ..add('fullAddress')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.fullName;
    if (value != null) {
      result
        ..add('fullName')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.geoCode;
    if (value != null) {
      result
        ..add('geoCode')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(LatLng)));
    }
    value = object.phone;
    if (value != null) {
      result
        ..add('phone')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  HomeStruct deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new HomeStructBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'cityLocality':
          result.cityLocality = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'countryCode':
          result.countryCode = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'fullAddress':
          result.fullAddress = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'fullName':
          result.fullName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'geoCode':
          result.geoCode = serializers.deserialize(value,
              specifiedType: const FullType(LatLng)) as LatLng?;
          break;
        case 'phone':
          result.phone = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'firestoreUtilData':
          result.firestoreUtilData = serializers.deserialize(value,
                  specifiedType: const FullType(FirestoreUtilData))!
              as FirestoreUtilData;
          break;
      }
    }

    return result.build();
  }
}

class _$HomeStruct extends HomeStruct {
  @override
  final String? cityLocality;
  @override
  final String? countryCode;
  @override
  final String? fullAddress;
  @override
  final String? fullName;
  @override
  final LatLng? geoCode;
  @override
  final String? phone;
  @override
  final FirestoreUtilData firestoreUtilData;

  factory _$HomeStruct([void Function(HomeStructBuilder)? updates]) =>
      (new HomeStructBuilder()..update(updates))._build();

  _$HomeStruct._(
      {this.cityLocality,
      this.countryCode,
      this.fullAddress,
      this.fullName,
      this.geoCode,
      this.phone,
      required this.firestoreUtilData})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        firestoreUtilData, r'HomeStruct', 'firestoreUtilData');
  }

  @override
  HomeStruct rebuild(void Function(HomeStructBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  HomeStructBuilder toBuilder() => new HomeStructBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is HomeStruct &&
        cityLocality == other.cityLocality &&
        countryCode == other.countryCode &&
        fullAddress == other.fullAddress &&
        fullName == other.fullName &&
        geoCode == other.geoCode &&
        phone == other.phone &&
        firestoreUtilData == other.firestoreUtilData;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc($jc(0, cityLocality.hashCode),
                            countryCode.hashCode),
                        fullAddress.hashCode),
                    fullName.hashCode),
                geoCode.hashCode),
            phone.hashCode),
        firestoreUtilData.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'HomeStruct')
          ..add('cityLocality', cityLocality)
          ..add('countryCode', countryCode)
          ..add('fullAddress', fullAddress)
          ..add('fullName', fullName)
          ..add('geoCode', geoCode)
          ..add('phone', phone)
          ..add('firestoreUtilData', firestoreUtilData))
        .toString();
  }
}

class HomeStructBuilder implements Builder<HomeStruct, HomeStructBuilder> {
  _$HomeStruct? _$v;

  String? _cityLocality;
  String? get cityLocality => _$this._cityLocality;
  set cityLocality(String? cityLocality) => _$this._cityLocality = cityLocality;

  String? _countryCode;
  String? get countryCode => _$this._countryCode;
  set countryCode(String? countryCode) => _$this._countryCode = countryCode;

  String? _fullAddress;
  String? get fullAddress => _$this._fullAddress;
  set fullAddress(String? fullAddress) => _$this._fullAddress = fullAddress;

  String? _fullName;
  String? get fullName => _$this._fullName;
  set fullName(String? fullName) => _$this._fullName = fullName;

  LatLng? _geoCode;
  LatLng? get geoCode => _$this._geoCode;
  set geoCode(LatLng? geoCode) => _$this._geoCode = geoCode;

  String? _phone;
  String? get phone => _$this._phone;
  set phone(String? phone) => _$this._phone = phone;

  FirestoreUtilData? _firestoreUtilData;
  FirestoreUtilData? get firestoreUtilData => _$this._firestoreUtilData;
  set firestoreUtilData(FirestoreUtilData? firestoreUtilData) =>
      _$this._firestoreUtilData = firestoreUtilData;

  HomeStructBuilder() {
    HomeStruct._initializeBuilder(this);
  }

  HomeStructBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _cityLocality = $v.cityLocality;
      _countryCode = $v.countryCode;
      _fullAddress = $v.fullAddress;
      _fullName = $v.fullName;
      _geoCode = $v.geoCode;
      _phone = $v.phone;
      _firestoreUtilData = $v.firestoreUtilData;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(HomeStruct other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$HomeStruct;
  }

  @override
  void update(void Function(HomeStructBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  HomeStruct build() => _build();

  _$HomeStruct _build() {
    final _$result = _$v ??
        new _$HomeStruct._(
            cityLocality: cityLocality,
            countryCode: countryCode,
            fullAddress: fullAddress,
            fullName: fullName,
            geoCode: geoCode,
            phone: phone,
            firestoreUtilData: BuiltValueNullFieldError.checkNotNull(
                firestoreUtilData, r'HomeStruct', 'firestoreUtilData'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
