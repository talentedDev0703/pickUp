// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'packages_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<PackagesRecord> _$packagesRecordSerializer =
    new _$PackagesRecordSerializer();

class _$PackagesRecordSerializer
    implements StructuredSerializer<PackagesRecord> {
  @override
  final Iterable<Type> types = const [PackagesRecord, _$PackagesRecord];
  @override
  final String wireName = 'PackagesRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, PackagesRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'shipTo',
      serializers.serialize(object.shipTo,
          specifiedType: const FullType(ShipToStruct)),
    ];
    Object? value;
    value = object.isDamaged;
    if (value != null) {
      result
        ..add('isDamaged')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.carrierPackageId;
    if (value != null) {
      result
        ..add('carrierPackageId')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.uid;
    if (value != null) {
      result
        ..add('uid')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.damageDateTime;
    if (value != null) {
      result
        ..add('damageDateTime')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.damagedUrl;
    if (value != null) {
      result
        ..add('damagedUrl')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.carrierCode;
    if (value != null) {
      result
        ..add('carrierCode')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.serviceCode;
    if (value != null) {
      result
        ..add('serviceCode')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.rate;
    if (value != null) {
      result
        ..add('rate')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.withUser;
    if (value != null) {
      result
        ..add('withUser')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.status;
    if (value != null) {
      result
        ..add('status')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
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
  PackagesRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new PackagesRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'isDamaged':
          result.isDamaged = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'carrierPackageId':
          result.carrierPackageId = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'uid':
          result.uid = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'damageDateTime':
          result.damageDateTime = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'damagedUrl':
          result.damagedUrl = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'carrierCode':
          result.carrierCode = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'serviceCode':
          result.serviceCode = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'shipTo':
          result.shipTo.replace(serializers.deserialize(value,
              specifiedType: const FullType(ShipToStruct))! as ShipToStruct);
          break;
        case 'rate':
          result.rate = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'withUser':
          result.withUser = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'status':
          result.status = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
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

class _$PackagesRecord extends PackagesRecord {
  @override
  final bool? isDamaged;
  @override
  final String? carrierPackageId;
  @override
  final String? uid;
  @override
  final DateTime? damageDateTime;
  @override
  final String? damagedUrl;
  @override
  final String? carrierCode;
  @override
  final String? serviceCode;
  @override
  final ShipToStruct shipTo;
  @override
  final String? rate;
  @override
  final String? withUser;
  @override
  final String? status;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$PackagesRecord([void Function(PackagesRecordBuilder)? updates]) =>
      (new PackagesRecordBuilder()..update(updates))._build();

  _$PackagesRecord._(
      {this.isDamaged,
      this.carrierPackageId,
      this.uid,
      this.damageDateTime,
      this.damagedUrl,
      this.carrierCode,
      this.serviceCode,
      required this.shipTo,
      this.rate,
      this.withUser,
      this.status,
      this.ffRef})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(shipTo, r'PackagesRecord', 'shipTo');
  }

  @override
  PackagesRecord rebuild(void Function(PackagesRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PackagesRecordBuilder toBuilder() =>
      new PackagesRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PackagesRecord &&
        isDamaged == other.isDamaged &&
        carrierPackageId == other.carrierPackageId &&
        uid == other.uid &&
        damageDateTime == other.damageDateTime &&
        damagedUrl == other.damagedUrl &&
        carrierCode == other.carrierCode &&
        serviceCode == other.serviceCode &&
        shipTo == other.shipTo &&
        rate == other.rate &&
        withUser == other.withUser &&
        status == other.status &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc(
                            $jc(
                                $jc(
                                    $jc(
                                        $jc(
                                            $jc($jc(0, isDamaged.hashCode),
                                                carrierPackageId.hashCode),
                                            uid.hashCode),
                                        damageDateTime.hashCode),
                                    damagedUrl.hashCode),
                                carrierCode.hashCode),
                            serviceCode.hashCode),
                        shipTo.hashCode),
                    rate.hashCode),
                withUser.hashCode),
            status.hashCode),
        ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'PackagesRecord')
          ..add('isDamaged', isDamaged)
          ..add('carrierPackageId', carrierPackageId)
          ..add('uid', uid)
          ..add('damageDateTime', damageDateTime)
          ..add('damagedUrl', damagedUrl)
          ..add('carrierCode', carrierCode)
          ..add('serviceCode', serviceCode)
          ..add('shipTo', shipTo)
          ..add('rate', rate)
          ..add('withUser', withUser)
          ..add('status', status)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class PackagesRecordBuilder
    implements Builder<PackagesRecord, PackagesRecordBuilder> {
  _$PackagesRecord? _$v;

  bool? _isDamaged;
  bool? get isDamaged => _$this._isDamaged;
  set isDamaged(bool? isDamaged) => _$this._isDamaged = isDamaged;

  String? _carrierPackageId;
  String? get carrierPackageId => _$this._carrierPackageId;
  set carrierPackageId(String? carrierPackageId) =>
      _$this._carrierPackageId = carrierPackageId;

  String? _uid;
  String? get uid => _$this._uid;
  set uid(String? uid) => _$this._uid = uid;

  DateTime? _damageDateTime;
  DateTime? get damageDateTime => _$this._damageDateTime;
  set damageDateTime(DateTime? damageDateTime) =>
      _$this._damageDateTime = damageDateTime;

  String? _damagedUrl;
  String? get damagedUrl => _$this._damagedUrl;
  set damagedUrl(String? damagedUrl) => _$this._damagedUrl = damagedUrl;

  String? _carrierCode;
  String? get carrierCode => _$this._carrierCode;
  set carrierCode(String? carrierCode) => _$this._carrierCode = carrierCode;

  String? _serviceCode;
  String? get serviceCode => _$this._serviceCode;
  set serviceCode(String? serviceCode) => _$this._serviceCode = serviceCode;

  ShipToStructBuilder? _shipTo;
  ShipToStructBuilder get shipTo =>
      _$this._shipTo ??= new ShipToStructBuilder();
  set shipTo(ShipToStructBuilder? shipTo) => _$this._shipTo = shipTo;

  String? _rate;
  String? get rate => _$this._rate;
  set rate(String? rate) => _$this._rate = rate;

  String? _withUser;
  String? get withUser => _$this._withUser;
  set withUser(String? withUser) => _$this._withUser = withUser;

  String? _status;
  String? get status => _$this._status;
  set status(String? status) => _$this._status = status;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  PackagesRecordBuilder() {
    PackagesRecord._initializeBuilder(this);
  }

  PackagesRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _isDamaged = $v.isDamaged;
      _carrierPackageId = $v.carrierPackageId;
      _uid = $v.uid;
      _damageDateTime = $v.damageDateTime;
      _damagedUrl = $v.damagedUrl;
      _carrierCode = $v.carrierCode;
      _serviceCode = $v.serviceCode;
      _shipTo = $v.shipTo.toBuilder();
      _rate = $v.rate;
      _withUser = $v.withUser;
      _status = $v.status;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PackagesRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$PackagesRecord;
  }

  @override
  void update(void Function(PackagesRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  PackagesRecord build() => _build();

  _$PackagesRecord _build() {
    _$PackagesRecord _$result;
    try {
      _$result = _$v ??
          new _$PackagesRecord._(
              isDamaged: isDamaged,
              carrierPackageId: carrierPackageId,
              uid: uid,
              damageDateTime: damageDateTime,
              damagedUrl: damagedUrl,
              carrierCode: carrierCode,
              serviceCode: serviceCode,
              shipTo: shipTo.build(),
              rate: rate,
              withUser: withUser,
              status: status,
              ffRef: ffRef);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'shipTo';
        shipTo.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'PackagesRecord', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
