import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'rating_record.g.dart';

abstract class RatingRecord
    implements Built<RatingRecord, RatingRecordBuilder> {
  static Serializer<RatingRecord> get serializer => _$ratingRecordSerializer;

  double? get stars;

  String? get userNotes;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  DocumentReference get parentReference => reference.parent.parent!;

  static void _initializeBuilder(RatingRecordBuilder builder) => builder
    ..stars = 0.0
    ..userNotes = '';

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('Rating')
          : FirebaseFirestore.instance.collectionGroup('Rating');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('Rating').doc();

  static Stream<RatingRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<RatingRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  RatingRecord._();
  factory RatingRecord([void Function(RatingRecordBuilder) updates]) =
      _$RatingRecord;

  static RatingRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createRatingRecordData({
  double? stars,
  String? userNotes,
}) {
  final firestoreData = serializers.toFirestore(
    RatingRecord.serializer,
    RatingRecord(
      (r) => r
        ..stars = stars
        ..userNotes = userNotes,
    ),
  );

  return firestoreData;
}
