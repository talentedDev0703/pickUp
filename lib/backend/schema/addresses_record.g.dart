// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'addresses_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<AddressesRecord> _$addressesRecordSerializer =
    new _$AddressesRecordSerializer();

class _$AddressesRecordSerializer
    implements StructuredSerializer<AddressesRecord> {
  @override
  final Iterable<Type> types = const [AddressesRecord, _$AddressesRecord];
  @override
  final String wireName = 'AddressesRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, AddressesRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.type;
    if (value != null) {
      result
        ..add('type')
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
  AddressesRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new AddressesRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'type':
          result.type = serializers.deserialize(value,
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

class _$AddressesRecord extends AddressesRecord {
  @override
  final String? type;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$AddressesRecord([void Function(AddressesRecordBuilder)? updates]) =>
      (new AddressesRecordBuilder()..update(updates))._build();

  _$AddressesRecord._({this.type, this.ffRef}) : super._();

  @override
  AddressesRecord rebuild(void Function(AddressesRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AddressesRecordBuilder toBuilder() =>
      new AddressesRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AddressesRecord &&
        type == other.type &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, type.hashCode), ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'AddressesRecord')
          ..add('type', type)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class AddressesRecordBuilder
    implements Builder<AddressesRecord, AddressesRecordBuilder> {
  _$AddressesRecord? _$v;

  String? _type;
  String? get type => _$this._type;
  set type(String? type) => _$this._type = type;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  AddressesRecordBuilder() {
    AddressesRecord._initializeBuilder(this);
  }

  AddressesRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _type = $v.type;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AddressesRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$AddressesRecord;
  }

  @override
  void update(void Function(AddressesRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  AddressesRecord build() => _build();

  _$AddressesRecord _build() {
    final _$result = _$v ?? new _$AddressesRecord._(type: type, ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
