import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'delivery_event_record.g.dart';

abstract class DeliveryEventRecord
    implements Built<DeliveryEventRecord, DeliveryEventRecordBuilder> {
  static Serializer<DeliveryEventRecord> get serializer =>
      _$deliveryEventRecordSerializer;

  String? get packageID;

  String? get userID;

  LatLng? get geoCode;

  DateTime? get capturedAt;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  DocumentReference get parentReference => reference.parent.parent!;

  static void _initializeBuilder(DeliveryEventRecordBuilder builder) => builder
    ..packageID = ''
    ..userID = '';

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('deliveryEvent')
          : FirebaseFirestore.instance.collectionGroup('deliveryEvent');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('deliveryEvent').doc();

  static Stream<DeliveryEventRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<DeliveryEventRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then(
          (s) => serializers.deserializeWith(serializer, serializedData(s))!);

  DeliveryEventRecord._();
  factory DeliveryEventRecord(
          [void Function(DeliveryEventRecordBuilder) updates]) =
      _$DeliveryEventRecord;

  static DeliveryEventRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createDeliveryEventRecordData({
  String? packageID,
  String? userID,
  LatLng? geoCode,
  DateTime? capturedAt,
}) {
  final firestoreData = serializers.toFirestore(
    DeliveryEventRecord.serializer,
    DeliveryEventRecord(
      (d) => d
        ..packageID = packageID
        ..userID = userID
        ..geoCode = geoCode
        ..capturedAt = capturedAt,
    ),
  );

  return firestoreData;
}
