import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'images_record.g.dart';

abstract class ImagesRecord
    implements Built<ImagesRecord, ImagesRecordBuilder> {
  static Serializer<ImagesRecord> get serializer => _$imagesRecordSerializer;

  String? get imgUrl;

  String? get metaData;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  DocumentReference get parentReference => reference.parent.parent!;

  static void _initializeBuilder(ImagesRecordBuilder builder) => builder
    ..imgUrl = ''
    ..metaData = '';

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('images')
          : FirebaseFirestore.instance.collectionGroup('images');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('images').doc();

  static Stream<ImagesRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<ImagesRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  ImagesRecord._();
  factory ImagesRecord([void Function(ImagesRecordBuilder) updates]) =
      _$ImagesRecord;

  static ImagesRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createImagesRecordData({
  String? imgUrl,
  String? metaData,
}) {
  final firestoreData = serializers.toFirestore(
    ImagesRecord.serializer,
    ImagesRecord(
      (i) => i
        ..imgUrl = imgUrl
        ..metaData = metaData,
    ),
  );

  return firestoreData;
}
