import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'packages_record.g.dart';

abstract class PackagesRecord
    implements Built<PackagesRecord, PackagesRecordBuilder> {
  static Serializer<PackagesRecord> get serializer =>
      _$packagesRecordSerializer;

  bool? get isDamaged;

  String? get carrierPackageId;

  String? get uid;

  DateTime? get damageDateTime;

  String? get damagedUrl;

  String? get carrierCode;

  String? get serviceCode;

  ShipToStruct get shipTo;

  String? get rate;

  String? get withUser;

  String? get status;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(PackagesRecordBuilder builder) => builder
    ..isDamaged = false
    ..carrierPackageId = ''
    ..uid = ''
    ..damagedUrl = ''
    ..carrierCode = ''
    ..serviceCode = ''
    ..shipTo = ShipToStructBuilder()
    ..rate = ''
    ..withUser = ''
    ..status = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('packages');

  static Stream<PackagesRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<PackagesRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  PackagesRecord._();
  factory PackagesRecord([void Function(PackagesRecordBuilder) updates]) =
      _$PackagesRecord;

  static PackagesRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createPackagesRecordData({
  bool? isDamaged,
  String? carrierPackageId,
  String? uid,
  DateTime? damageDateTime,
  String? damagedUrl,
  String? carrierCode,
  String? serviceCode,
  ShipToStruct? shipTo,
  String? rate,
  String? withUser,
  String? status,
}) {
  final firestoreData = serializers.toFirestore(
    PackagesRecord.serializer,
    PackagesRecord(
      (p) => p
        ..isDamaged = isDamaged
        ..carrierPackageId = carrierPackageId
        ..uid = uid
        ..damageDateTime = damageDateTime
        ..damagedUrl = damagedUrl
        ..carrierCode = carrierCode
        ..serviceCode = serviceCode
        ..shipTo = ShipToStructBuilder()
        ..rate = rate
        ..withUser = withUser
        ..status = status,
    ),
  );

  // Handle nested data for "shipTo" field.
  addShipToStructData(firestoreData, shipTo, 'shipTo');

  return firestoreData;
}
