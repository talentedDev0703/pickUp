import 'dart:async';

import '../index.dart';
import '../serializers.dart';
import 'package:built_value/built_value.dart';

part 'ship_to_struct.g.dart';

abstract class ShipToStruct
    implements Built<ShipToStruct, ShipToStructBuilder> {
  static Serializer<ShipToStruct> get serializer => _$shipToStructSerializer;

  String? get fullAddress;

  /// Utility class for Firestore updates
  FirestoreUtilData get firestoreUtilData;

  static void _initializeBuilder(ShipToStructBuilder builder) => builder
    ..fullAddress = ''
    ..firestoreUtilData = FirestoreUtilData();

  ShipToStruct._();
  factory ShipToStruct([void Function(ShipToStructBuilder) updates]) =
      _$ShipToStruct;
}

ShipToStruct createShipToStruct({
  String? fullAddress,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    ShipToStruct(
      (s) => s
        ..fullAddress = fullAddress
        ..firestoreUtilData = FirestoreUtilData(
          clearUnsetFields: clearUnsetFields,
          create: create,
          delete: delete,
          fieldValues: fieldValues,
        ),
    );

ShipToStruct? updateShipToStruct(
  ShipToStruct? shipTo, {
  bool clearUnsetFields = true,
}) =>
    shipTo != null
        ? (shipTo.toBuilder()
              ..firestoreUtilData =
                  FirestoreUtilData(clearUnsetFields: clearUnsetFields))
            .build()
        : null;

void addShipToStructData(
  Map<String, dynamic> firestoreData,
  ShipToStruct? shipTo,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (shipTo == null) {
    return;
  }
  if (shipTo.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  if (!forFieldValue && shipTo.firestoreUtilData.clearUnsetFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final shipToData = getShipToFirestoreData(shipTo, forFieldValue);
  final nestedData = shipToData.map((k, v) => MapEntry('$fieldName.$k', v));

  final create = shipTo.firestoreUtilData.create;
  firestoreData.addAll(create ? mergeNestedFields(nestedData) : nestedData);

  return;
}

Map<String, dynamic> getShipToFirestoreData(
  ShipToStruct? shipTo, [
  bool forFieldValue = false,
]) {
  if (shipTo == null) {
    return {};
  }
  final firestoreData =
      serializers.toFirestore(ShipToStruct.serializer, shipTo);

  // Add any Firestore field values
  shipTo.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getShipToListFirestoreData(
  List<ShipToStruct>? shipTos,
) =>
    shipTos?.map((s) => getShipToFirestoreData(s, true)).toList() ?? [];
