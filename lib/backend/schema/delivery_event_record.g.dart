// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'delivery_event_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<DeliveryEventRecord> _$deliveryEventRecordSerializer =
    new _$DeliveryEventRecordSerializer();

class _$DeliveryEventRecordSerializer
    implements StructuredSerializer<DeliveryEventRecord> {
  @override
  final Iterable<Type> types = const [
    DeliveryEventRecord,
    _$DeliveryEventRecord
  ];
  @override
  final String wireName = 'DeliveryEventRecord';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, DeliveryEventRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.packageID;
    if (value != null) {
      result
        ..add('packageID')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.userID;
    if (value != null) {
      result
        ..add('userID')
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
    value = object.capturedAt;
    if (value != null) {
      result
        ..add('capturedAt')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.ffRef;
    if (value != null) {
      result
        ..add('Document__Reference__Field')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    return result;
  }

  @override
  DeliveryEventRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new DeliveryEventRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'packageID':
          result.packageID = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'userID':
          result.userID = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'geoCode':
          result.geoCode = serializers.deserialize(value,
              specifiedType: const FullType(LatLng)) as LatLng?;
          break;
        case 'capturedAt':
          result.capturedAt = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'Document__Reference__Field':
          result.ffRef = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
      }
    }

    return result.build();
  }
}

class _$DeliveryEventRecord extends DeliveryEventRecord {
  @override
  final String? packageID;
  @override
  final String? userID;
  @override
  final LatLng? geoCode;
  @override
  final DateTime? capturedAt;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$DeliveryEventRecord(
          [void Function(DeliveryEventRecordBuilder)? updates]) =>
      (new DeliveryEventRecordBuilder()..update(updates))._build();

  _$DeliveryEventRecord._(
      {this.packageID, this.userID, this.geoCode, this.capturedAt, this.ffRef})
      : super._();

  @override
  DeliveryEventRecord rebuild(
          void Function(DeliveryEventRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  DeliveryEventRecordBuilder toBuilder() =>
      new DeliveryEventRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is DeliveryEventRecord &&
        packageID == other.packageID &&
        userID == other.userID &&
        geoCode == other.geoCode &&
        capturedAt == other.capturedAt &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc($jc($jc(0, packageID.hashCode), userID.hashCode),
                geoCode.hashCode),
            capturedAt.hashCode),
        ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'DeliveryEventRecord')
          ..add('packageID', packageID)
          ..add('userID', userID)
          ..add('geoCode', geoCode)
          ..add('capturedAt', capturedAt)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class DeliveryEventRecordBuilder
    implements Builder<DeliveryEventRecord, DeliveryEventRecordBuilder> {
  _$DeliveryEventRecord? _$v;

  String? _packageID;
  String? get packageID => _$this._packageID;
  set packageID(String? packageID) => _$this._packageID = packageID;

  String? _userID;
  String? get userID => _$this._userID;
  set userID(String? userID) => _$this._userID = userID;

  LatLng? _geoCode;
  LatLng? get geoCode => _$this._geoCode;
  set geoCode(LatLng? geoCode) => _$this._geoCode = geoCode;

  DateTime? _capturedAt;
  DateTime? get capturedAt => _$this._capturedAt;
  set capturedAt(DateTime? capturedAt) => _$this._capturedAt = capturedAt;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  DeliveryEventRecordBuilder() {
    DeliveryEventRecord._initializeBuilder(this);
  }

  DeliveryEventRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _packageID = $v.packageID;
      _userID = $v.userID;
      _geoCode = $v.geoCode;
      _capturedAt = $v.capturedAt;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(DeliveryEventRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$DeliveryEventRecord;
  }

  @override
  void update(void Function(DeliveryEventRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  DeliveryEventRecord build() => _build();

  _$DeliveryEventRecord _build() {
    final _$result = _$v ??
        new _$DeliveryEventRecord._(
            packageID: packageID,
            userID: userID,
            geoCode: geoCode,
            capturedAt: capturedAt,
            ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
