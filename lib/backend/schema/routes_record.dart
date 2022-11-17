import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'routes_record.g.dart';

abstract class RoutesRecord
    implements Built<RoutesRecord, RoutesRecordBuilder> {
  static Serializer<RoutesRecord> get serializer => _$routesRecordSerializer;

  String? get encodedPolyline;

  String? get status;

  String? get userId;

  bool? get generatePolyline;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(RoutesRecordBuilder builder) => builder
    ..encodedPolyline = ''
    ..status = ''
    ..userId = ''
    ..generatePolyline = false;

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('routes');

  static Stream<RoutesRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<RoutesRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  RoutesRecord._();
  factory RoutesRecord([void Function(RoutesRecordBuilder) updates]) =
      _$RoutesRecord;

  static RoutesRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createRoutesRecordData({
  String? encodedPolyline,
  String? status,
  String? userId,
  bool? generatePolyline,
}) {
  final firestoreData = serializers.toFirestore(
    RoutesRecord.serializer,
    RoutesRecord(
      (r) => r
        ..encodedPolyline = encodedPolyline
        ..status = status
        ..userId = userId
        ..generatePolyline = generatePolyline,
    ),
  );

  return firestoreData;
}
