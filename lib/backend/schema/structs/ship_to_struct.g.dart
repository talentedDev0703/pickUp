// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ship_to_struct.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<ShipToStruct> _$shipToStructSerializer =
    new _$ShipToStructSerializer();

class _$ShipToStructSerializer implements StructuredSerializer<ShipToStruct> {
  @override
  final Iterable<Type> types = const [ShipToStruct, _$ShipToStruct];
  @override
  final String wireName = 'ShipToStruct';

  @override
  Iterable<Object?> serialize(Serializers serializers, ShipToStruct object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'firestoreUtilData',
      serializers.serialize(object.firestoreUtilData,
          specifiedType: const FullType(FirestoreUtilData)),
    ];
    Object? value;
    value = object.fullAddress;
    if (value != null) {
      result
        ..add('fullAddress')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  ShipToStruct deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ShipToStructBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'fullAddress':
          result.fullAddress = serializers.deserialize(value,
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

class _$ShipToStruct extends ShipToStruct {
  @override
  final String? fullAddress;
  @override
  final FirestoreUtilData firestoreUtilData;

  factory _$ShipToStruct([void Function(ShipToStructBuilder)? updates]) =>
      (new ShipToStructBuilder()..update(updates))._build();

  _$ShipToStruct._({this.fullAddress, required this.firestoreUtilData})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        firestoreUtilData, r'ShipToStruct', 'firestoreUtilData');
  }

  @override
  ShipToStruct rebuild(void Function(ShipToStructBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ShipToStructBuilder toBuilder() => new ShipToStructBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ShipToStruct &&
        fullAddress == other.fullAddress &&
        firestoreUtilData == other.firestoreUtilData;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, fullAddress.hashCode), firestoreUtilData.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ShipToStruct')
          ..add('fullAddress', fullAddress)
          ..add('firestoreUtilData', firestoreUtilData))
        .toString();
  }
}

class ShipToStructBuilder
    implements Builder<ShipToStruct, ShipToStructBuilder> {
  _$ShipToStruct? _$v;

  String? _fullAddress;
  String? get fullAddress => _$this._fullAddress;
  set fullAddress(String? fullAddress) => _$this._fullAddress = fullAddress;

  FirestoreUtilData? _firestoreUtilData;
  FirestoreUtilData? get firestoreUtilData => _$this._firestoreUtilData;
  set firestoreUtilData(FirestoreUtilData? firestoreUtilData) =>
      _$this._firestoreUtilData = firestoreUtilData;

  ShipToStructBuilder() {
    ShipToStruct._initializeBuilder(this);
  }

  ShipToStructBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _fullAddress = $v.fullAddress;
      _firestoreUtilData = $v.firestoreUtilData;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ShipToStruct other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ShipToStruct;
  }

  @override
  void update(void Function(ShipToStructBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ShipToStruct build() => _build();

  _$ShipToStruct _build() {
    final _$result = _$v ??
        new _$ShipToStruct._(
            fullAddress: fullAddress,
            firestoreUtilData: BuiltValueNullFieldError.checkNotNull(
                firestoreUtilData, r'ShipToStruct', 'firestoreUtilData'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
