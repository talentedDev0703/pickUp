import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'package_record.g.dart';

abstract class PackageRecord
    implements Built<PackageRecord, PackageRecordBuilder> {
  static Serializer<PackageRecord> get serializer => _$packageRecordSerializer;

  String? get deliveryOrder;

  String? get packageId;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  DocumentReference get parentReference => reference.parent.parent!;

  static void _initializeBuilder(PackageRecordBuilder builder) => builder
    ..deliveryOrder = ''
    ..packageId = '';

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('Package')
          : FirebaseFirestore.instance.collectionGroup('Package');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('Package').doc();

  static Stream<PackageRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<PackageRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  PackageRecord._();
  factory PackageRecord([void Function(PackageRecordBuilder) updates]) =
      _$PackageRecord;

  static PackageRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createPackageRecordData({
  String? deliveryOrder,
  String? packageId,
}) {
  final firestoreData = serializers.toFirestore(
    PackageRecord.serializer,
    PackageRecord(
      (p) => p
        ..deliveryOrder = deliveryOrder
        ..packageId = packageId,
    ),
  );

  return firestoreData;
}
