import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'activities_record.g.dart';

abstract class ActivitiesRecord
    implements Built<ActivitiesRecord, ActivitiesRecordBuilder> {
  static Serializer<ActivitiesRecord> get serializer =>
      _$activitiesRecordSerializer;

  @BuiltValueField(wireName: 'Status')
  String? get status;

  String? get description;

  DateTime? get logTime;

  LatLng? get loggedAt;

  String? get method;

  String? get recordedByUserId;

  bool? get userHasCustody;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  DocumentReference get parentReference => reference.parent.parent!;

  static void _initializeBuilder(ActivitiesRecordBuilder builder) => builder
    ..status = ''
    ..description = ''
    ..method = ''
    ..recordedByUserId = ''
    ..userHasCustody = false;

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('activities')
          : FirebaseFirestore.instance.collectionGroup('activities');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('activities').doc();

  static Stream<ActivitiesRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<ActivitiesRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  ActivitiesRecord._();
  factory ActivitiesRecord([void Function(ActivitiesRecordBuilder) updates]) =
      _$ActivitiesRecord;

  static ActivitiesRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createActivitiesRecordData({
  String? status,
  String? description,
  DateTime? logTime,
  LatLng? loggedAt,
  String? method,
  String? recordedByUserId,
  bool? userHasCustody,
}) {
  final firestoreData = serializers.toFirestore(
    ActivitiesRecord.serializer,
    ActivitiesRecord(
      (a) => a
        ..status = status
        ..description = description
        ..logTime = logTime
        ..loggedAt = loggedAt
        ..method = method
        ..recordedByUserId = recordedByUserId
        ..userHasCustody = userHasCustody,
    ),
  );

  return firestoreData;
}
