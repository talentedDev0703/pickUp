// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'permissions_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<PermissionsRecord> _$permissionsRecordSerializer =
    new _$PermissionsRecordSerializer();

class _$PermissionsRecordSerializer
    implements StructuredSerializer<PermissionsRecord> {
  @override
  final Iterable<Type> types = const [PermissionsRecord, _$PermissionsRecord];
  @override
  final String wireName = 'PermissionsRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, PermissionsRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.flag;
    if (value != null) {
      result
        ..add('flag')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.permission;
    if (value != null) {
      result
        ..add('permission')
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
  PermissionsRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new PermissionsRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'flag':
          result.flag = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'permission':
          result.permission = serializers.deserialize(value,
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

class _$PermissionsRecord extends PermissionsRecord {
  @override
  final bool? flag;
  @override
  final String? permission;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$PermissionsRecord(
          [void Function(PermissionsRecordBuilder)? updates]) =>
      (new PermissionsRecordBuilder()..update(updates))._build();

  _$PermissionsRecord._({this.flag, this.permission, this.ffRef}) : super._();

  @override
  PermissionsRecord rebuild(void Function(PermissionsRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PermissionsRecordBuilder toBuilder() =>
      new PermissionsRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PermissionsRecord &&
        flag == other.flag &&
        permission == other.permission &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    return $jf(
        $jc($jc($jc(0, flag.hashCode), permission.hashCode), ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'PermissionsRecord')
          ..add('flag', flag)
          ..add('permission', permission)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class PermissionsRecordBuilder
    implements Builder<PermissionsRecord, PermissionsRecordBuilder> {
  _$PermissionsRecord? _$v;

  bool? _flag;
  bool? get flag => _$this._flag;
  set flag(bool? flag) => _$this._flag = flag;

  String? _permission;
  String? get permission => _$this._permission;
  set permission(String? permission) => _$this._permission = permission;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  PermissionsRecordBuilder() {
    PermissionsRecord._initializeBuilder(this);
  }

  PermissionsRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _flag = $v.flag;
      _permission = $v.permission;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PermissionsRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$PermissionsRecord;
  }

  @override
  void update(void Function(PermissionsRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  PermissionsRecord build() => _build();

  _$PermissionsRecord _build() {
    final _$result = _$v ??
        new _$PermissionsRecord._(
            flag: flag, permission: permission, ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
