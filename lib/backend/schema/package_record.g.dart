// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'package_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<PackageRecord> _$packageRecordSerializer =
    new _$PackageRecordSerializer();

class _$PackageRecordSerializer implements StructuredSerializer<PackageRecord> {
  @override
  final Iterable<Type> types = const [PackageRecord, _$PackageRecord];
  @override
  final String wireName = 'PackageRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, PackageRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.deliveryOrder;
    if (value != null) {
      result
        ..add('deliveryOrder')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.packageId;
    if (value != null) {
      result
        ..add('packageId')
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
  PackageRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new PackageRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'deliveryOrder':
          result.deliveryOrder = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'packageId':
          result.packageId = serializers.deserialize(value,
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

class _$PackageRecord extends PackageRecord {
  @override
  final String? deliveryOrder;
  @override
  final String? packageId;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$PackageRecord([void Function(PackageRecordBuilder)? updates]) =>
      (new PackageRecordBuilder()..update(updates))._build();

  _$PackageRecord._({this.deliveryOrder, this.packageId, this.ffRef})
      : super._();

  @override
  PackageRecord rebuild(void Function(PackageRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PackageRecordBuilder toBuilder() => new PackageRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PackageRecord &&
        deliveryOrder == other.deliveryOrder &&
        packageId == other.packageId &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    return $jf($jc($jc($jc(0, deliveryOrder.hashCode), packageId.hashCode),
        ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'PackageRecord')
          ..add('deliveryOrder', deliveryOrder)
          ..add('packageId', packageId)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class PackageRecordBuilder
    implements Builder<PackageRecord, PackageRecordBuilder> {
  _$PackageRecord? _$v;

  String? _deliveryOrder;
  String? get deliveryOrder => _$this._deliveryOrder;
  set deliveryOrder(String? deliveryOrder) =>
      _$this._deliveryOrder = deliveryOrder;

  String? _packageId;
  String? get packageId => _$this._packageId;
  set packageId(String? packageId) => _$this._packageId = packageId;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  PackageRecordBuilder() {
    PackageRecord._initializeBuilder(this);
  }

  PackageRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _deliveryOrder = $v.deliveryOrder;
      _packageId = $v.packageId;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PackageRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$PackageRecord;
  }

  @override
  void update(void Function(PackageRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  PackageRecord build() => _build();

  _$PackageRecord _build() {
    final _$result = _$v ??
        new _$PackageRecord._(
            deliveryOrder: deliveryOrder, packageId: packageId, ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
