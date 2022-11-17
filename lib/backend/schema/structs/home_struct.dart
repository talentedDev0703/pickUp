import 'dart:async';

import '../index.dart';
import '../serializers.dart';
import 'package:built_value/built_value.dart';

part 'home_struct.g.dart';

abstract class HomeStruct implements Built<HomeStruct, HomeStructBuilder> {
  static Serializer<HomeStruct> get serializer => _$homeStructSerializer;

  String? get cityLocality;

  String? get countryCode;

  String? get fullAddress;

  String? get fullName;

  LatLng? get geoCode;

  String? get phone;

  /// Utility class for Firestore updates
  FirestoreUtilData get firestoreUtilData;

  static void _initializeBuilder(HomeStructBuilder builder) => builder
    ..cityLocality = ''
    ..countryCode = ''
    ..fullAddress = ''
    ..fullName = ''
    ..phone = ''
    ..firestoreUtilData = FirestoreUtilData();

  HomeStruct._();
  factory HomeStruct([void Function(HomeStructBuilder) updates]) = _$HomeStruct;
}

HomeStruct createHomeStruct({
  String? cityLocality,
  String? countryCode,
  String? fullAddress,
  String? fullName,
  LatLng? geoCode,
  String? phone,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    HomeStruct(
      (h) => h
        ..cityLocality = cityLocality
        ..countryCode = countryCode
        ..fullAddress = fullAddress
        ..fullName = fullName
        ..geoCode = geoCode
        ..phone = phone
        ..firestoreUtilData = FirestoreUtilData(
          clearUnsetFields: clearUnsetFields,
          create: create,
          delete: delete,
          fieldValues: fieldValues,
        ),
    );

HomeStruct? updateHomeStruct(
  HomeStruct? home, {
  bool clearUnsetFields = true,
}) =>
    home != null
        ? (home.toBuilder()
              ..firestoreUtilData =
                  FirestoreUtilData(clearUnsetFields: clearUnsetFields))
            .build()
        : null;

void addHomeStructData(
  Map<String, dynamic> firestoreData,
  HomeStruct? home,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (home == null) {
    return;
  }
  if (home.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  if (!forFieldValue && home.firestoreUtilData.clearUnsetFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final homeData = getHomeFirestoreData(home, forFieldValue);
  final nestedData = homeData.map((k, v) => MapEntry('$fieldName.$k', v));

  final create = home.firestoreUtilData.create;
  firestoreData.addAll(create ? mergeNestedFields(nestedData) : nestedData);

  return;
}

Map<String, dynamic> getHomeFirestoreData(
  HomeStruct? home, [
  bool forFieldValue = false,
]) {
  if (home == null) {
    return {};
  }
  final firestoreData = serializers.toFirestore(HomeStruct.serializer, home);

  // Add any Firestore field values
  home.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getHomeListFirestoreData(
  List<HomeStruct>? homes,
) =>
    homes?.map((h) => getHomeFirestoreData(h, true)).toList() ?? [];
