import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'addresses_record.g.dart';

abstract class AddressesRecord
    implements Built<AddressesRecord, AddressesRecordBuilder> {
  static Serializer<AddressesRecord> get serializer =>
      _$addressesRecordSerializer;

  String? get type;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  DocumentReference get parentReference => reference.parent.parent!;

  static void _initializeBuilder(AddressesRecordBuilder builder) =>
      builder..type = '';

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('addresses')
          : FirebaseFirestore.instance.collectionGroup('addresses');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('addresses').doc();

  static Stream<AddressesRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<AddressesRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  AddressesRecord._();
  factory AddressesRecord([void Function(AddressesRecordBuilder) updates]) =
      _$AddressesRecord;

  static AddressesRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createAddressesRecordData({
  String? type,
}) {
  final firestoreData = serializers.toFirestore(
    AddressesRecord.serializer,
    AddressesRecord(
      (a) => a..type = type,
    ),
  );

  return firestoreData;
}
