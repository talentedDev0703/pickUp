// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'activities_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<ActivitiesRecord> _$activitiesRecordSerializer =
    new _$ActivitiesRecordSerializer();

class _$ActivitiesRecordSerializer
    implements StructuredSerializer<ActivitiesRecord> {
  @override
  final Iterable<Type> types = const [ActivitiesRecord, _$ActivitiesRecord];
  @override
  final String wireName = 'ActivitiesRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, ActivitiesRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.status;
    if (value != null) {
      result
        ..add('Status')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.description;
    if (value != null) {
      result
        ..add('description')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.logTime;
    if (value != null) {
      result
        ..add('logTime')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.loggedAt;
    if (value != null) {
      result
        ..add('loggedAt')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(LatLng)));
    }
    value = object.method;
    if (value != null) {
      result
        ..add('method')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.recordedByUserId;
    if (value != null) {
      result
        ..add('recordedByUserId')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.userHasCustody;
    if (value != null) {
      result
        ..add('userHasCustody')
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
  ActivitiesRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ActivitiesRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'Status':
          result.status = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'description':
          result.description = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'logTime':
          result.logTime = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'loggedAt':
          result.loggedAt = serializers.deserialize(value,
              specifiedType: const FullType(LatLng)) as LatLng?;
          break;
        case 'method':
          result.method = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'recordedByUserId':
          result.recordedByUserId = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'userHasCustody':
          result.userHasCustody = serializers.deserialize(value,
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

class _$ActivitiesRecord extends ActivitiesRecord {
  @override
  final String? status;
  @override
  final String? description;
  @override
  final DateTime? logTime;
  @override
  final LatLng? loggedAt;
  @override
  final String? method;
  @override
  final String? recordedByUserId;
  @override
  final bool? userHasCustody;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$ActivitiesRecord(
          [void Function(ActivitiesRecordBuilder)? updates]) =>
      (new ActivitiesRecordBuilder()..update(updates))._build();

  _$ActivitiesRecord._(
      {this.status,
      this.description,
      this.logTime,
      this.loggedAt,
      this.method,
      this.recordedByUserId,
      this.userHasCustody,
      this.ffRef})
      : super._();

  @override
  ActivitiesRecord rebuild(void Function(ActivitiesRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ActivitiesRecordBuilder toBuilder() =>
      new ActivitiesRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ActivitiesRecord &&
        status == other.status &&
        description == other.description &&
        logTime == other.logTime &&
        loggedAt == other.loggedAt &&
        method == other.method &&
        recordedByUserId == other.recordedByUserId &&
        userHasCustody == other.userHasCustody &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc($jc($jc(0, status.hashCode), description.hashCode),
                            logTime.hashCode),
                        loggedAt.hashCode),
                    method.hashCode),
                recordedByUserId.hashCode),
            userHasCustody.hashCode),
        ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ActivitiesRecord')
          ..add('status', status)
          ..add('description', description)
          ..add('logTime', logTime)
          ..add('loggedAt', loggedAt)
          ..add('method', method)
          ..add('recordedByUserId', recordedByUserId)
          ..add('userHasCustody', userHasCustody)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class ActivitiesRecordBuilder
    implements Builder<ActivitiesRecord, ActivitiesRecordBuilder> {
  _$ActivitiesRecord? _$v;

  String? _status;
  String? get status => _$this._status;
  set status(String? status) => _$this._status = status;

  String? _description;
  String? get description => _$this._description;
  set description(String? description) => _$this._description = description;

  DateTime? _logTime;
  DateTime? get logTime => _$this._logTime;
  set logTime(DateTime? logTime) => _$this._logTime = logTime;

  LatLng? _loggedAt;
  LatLng? get loggedAt => _$this._loggedAt;
  set loggedAt(LatLng? loggedAt) => _$this._loggedAt = loggedAt;

  String? _method;
  String? get method => _$this._method;
  set method(String? method) => _$this._method = method;

  String? _recordedByUserId;
  String? get recordedByUserId => _$this._recordedByUserId;
  set recordedByUserId(String? recordedByUserId) =>
      _$this._recordedByUserId = recordedByUserId;

  bool? _userHasCustody;
  bool? get userHasCustody => _$this._userHasCustody;
  set userHasCustody(bool? userHasCustody) =>
      _$this._userHasCustody = userHasCustody;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  ActivitiesRecordBuilder() {
    ActivitiesRecord._initializeBuilder(this);
  }

  ActivitiesRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _status = $v.status;
      _description = $v.description;
      _logTime = $v.logTime;
      _loggedAt = $v.loggedAt;
      _method = $v.method;
      _recordedByUserId = $v.recordedByUserId;
      _userHasCustody = $v.userHasCustody;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ActivitiesRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ActivitiesRecord;
  }

  @override
  void update(void Function(ActivitiesRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ActivitiesRecord build() => _build();

  _$ActivitiesRecord _build() {
    final _$result = _$v ??
        new _$ActivitiesRecord._(
            status: status,
            description: description,
            logTime: logTime,
            loggedAt: loggedAt,
            method: method,
            recordedByUserId: recordedByUserId,
            userHasCustody: userHasCustody,
            ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
