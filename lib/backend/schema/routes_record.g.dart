// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'routes_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<RoutesRecord> _$routesRecordSerializer =
    new _$RoutesRecordSerializer();

class _$RoutesRecordSerializer implements StructuredSerializer<RoutesRecord> {
  @override
  final Iterable<Type> types = const [RoutesRecord, _$RoutesRecord];
  @override
  final String wireName = 'RoutesRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, RoutesRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.encodedPolyline;
    if (value != null) {
      result
        ..add('encodedPolyline')
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
    value = object.userId;
    if (value != null) {
      result
        ..add('userId')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.generatePolyline;
    if (value != null) {
      result
        ..add('generatePolyline')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
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
  RoutesRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new RoutesRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'encodedPolyline':
          result.encodedPolyline = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'status':
          result.status = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'userId':
          result.userId = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'generatePolyline':
          result.generatePolyline = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
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

class _$RoutesRecord extends RoutesRecord {
  @override
  final String? encodedPolyline;
  @override
  final String? status;
  @override
  final String? userId;
  @override
  final bool? generatePolyline;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$RoutesRecord([void Function(RoutesRecordBuilder)? updates]) =>
      (new RoutesRecordBuilder()..update(updates))._build();

  _$RoutesRecord._(
      {this.encodedPolyline,
      this.status,
      this.userId,
      this.generatePolyline,
      this.ffRef})
      : super._();

  @override
  RoutesRecord rebuild(void Function(RoutesRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  RoutesRecordBuilder toBuilder() => new RoutesRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is RoutesRecord &&
        encodedPolyline == other.encodedPolyline &&
        status == other.status &&
        userId == other.userId &&
        generatePolyline == other.generatePolyline &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc($jc($jc(0, encodedPolyline.hashCode), status.hashCode),
                userId.hashCode),
            generatePolyline.hashCode),
        ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'RoutesRecord')
          ..add('encodedPolyline', encodedPolyline)
          ..add('status', status)
          ..add('userId', userId)
          ..add('generatePolyline', generatePolyline)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class RoutesRecordBuilder
    implements Builder<RoutesRecord, RoutesRecordBuilder> {
  _$RoutesRecord? _$v;

  String? _encodedPolyline;
  String? get encodedPolyline => _$this._encodedPolyline;
  set encodedPolyline(String? encodedPolyline) =>
      _$this._encodedPolyline = encodedPolyline;

  String? _status;
  String? get status => _$this._status;
  set status(String? status) => _$this._status = status;

  String? _userId;
  String? get userId => _$this._userId;
  set userId(String? userId) => _$this._userId = userId;

  bool? _generatePolyline;
  bool? get generatePolyline => _$this._generatePolyline;
  set generatePolyline(bool? generatePolyline) =>
      _$this._generatePolyline = generatePolyline;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  RoutesRecordBuilder() {
    RoutesRecord._initializeBuilder(this);
  }

  RoutesRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _encodedPolyline = $v.encodedPolyline;
      _status = $v.status;
      _userId = $v.userId;
      _generatePolyline = $v.generatePolyline;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(RoutesRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$RoutesRecord;
  }

  @override
  void update(void Function(RoutesRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  RoutesRecord build() => _build();

  _$RoutesRecord _build() {
    final _$result = _$v ??
        new _$RoutesRecord._(
            encodedPolyline: encodedPolyline,
            status: status,
            userId: userId,
            generatePolyline: generatePolyline,
            ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
