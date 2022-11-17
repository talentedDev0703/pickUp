// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rating_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<RatingRecord> _$ratingRecordSerializer =
    new _$RatingRecordSerializer();

class _$RatingRecordSerializer implements StructuredSerializer<RatingRecord> {
  @override
  final Iterable<Type> types = const [RatingRecord, _$RatingRecord];
  @override
  final String wireName = 'RatingRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, RatingRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.stars;
    if (value != null) {
      result
        ..add('stars')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.userNotes;
    if (value != null) {
      result
        ..add('userNotes')
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
  RatingRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new RatingRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'stars':
          result.stars = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'userNotes':
          result.userNotes = serializers.deserialize(value,
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

class _$RatingRecord extends RatingRecord {
  @override
  final double? stars;
  @override
  final String? userNotes;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$RatingRecord([void Function(RatingRecordBuilder)? updates]) =>
      (new RatingRecordBuilder()..update(updates))._build();

  _$RatingRecord._({this.stars, this.userNotes, this.ffRef}) : super._();

  @override
  RatingRecord rebuild(void Function(RatingRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  RatingRecordBuilder toBuilder() => new RatingRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is RatingRecord &&
        stars == other.stars &&
        userNotes == other.userNotes &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    return $jf(
        $jc($jc($jc(0, stars.hashCode), userNotes.hashCode), ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'RatingRecord')
          ..add('stars', stars)
          ..add('userNotes', userNotes)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class RatingRecordBuilder
    implements Builder<RatingRecord, RatingRecordBuilder> {
  _$RatingRecord? _$v;

  double? _stars;
  double? get stars => _$this._stars;
  set stars(double? stars) => _$this._stars = stars;

  String? _userNotes;
  String? get userNotes => _$this._userNotes;
  set userNotes(String? userNotes) => _$this._userNotes = userNotes;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  RatingRecordBuilder() {
    RatingRecord._initializeBuilder(this);
  }

  RatingRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _stars = $v.stars;
      _userNotes = $v.userNotes;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(RatingRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$RatingRecord;
  }

  @override
  void update(void Function(RatingRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  RatingRecord build() => _build();

  _$RatingRecord _build() {
    final _$result = _$v ??
        new _$RatingRecord._(stars: stars, userNotes: userNotes, ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
