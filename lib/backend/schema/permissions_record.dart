import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'permissions_record.g.dart';

abstract class PermissionsRecord
    implements Built<PermissionsRecord, PermissionsRecordBuilder> {
  static Serializer<PermissionsRecord> get serializer =>
      _$permissionsRecordSerializer;

  bool? get flag;

  String? get permission;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  DocumentReference get parentReference => reference.parent.parent!;

  static void _initializeBuilder(PermissionsRecordBuilder builder) => builder
    ..flag = false
    ..permission = '';

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('permissions')
          : FirebaseFirestore.instance.collectionGroup('permissions');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('permissions').doc();

  static Stream<PermissionsRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<PermissionsRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  PermissionsRecord._();
  factory PermissionsRecord([void Function(PermissionsRecordBuilder) updates]) =
      _$PermissionsRecord;

  static PermissionsRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createPermissionsRecordData({
  bool? flag,
  String? permission,
}) {
  final firestoreData = serializers.toFirestore(
    PermissionsRecord.serializer,
    PermissionsRecord(
      (p) => p
        ..flag = flag
        ..permission = permission,
    ),
  );

  return firestoreData;
}
