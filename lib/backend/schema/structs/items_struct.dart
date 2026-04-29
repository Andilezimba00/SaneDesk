// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class ItemsStruct extends FFFirebaseStruct {
  ItemsStruct({
    String? descriptions,
    double? rate,
    int? quantity,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _descriptions = descriptions,
        _rate = rate,
        _quantity = quantity,
        super(firestoreUtilData);

  // "descriptions" field.
  String? _descriptions;
  String get descriptions => _descriptions ?? '';
  set descriptions(String? val) => _descriptions = val;

  bool hasDescriptions() => _descriptions != null;

  // "rate" field.
  double? _rate;
  double get rate => _rate ?? 0.0;
  set rate(double? val) => _rate = val;

  void incrementRate(double amount) => rate = rate + amount;

  bool hasRate() => _rate != null;

  // "quantity" field.
  int? _quantity;
  int get quantity => _quantity ?? 0;
  set quantity(int? val) => _quantity = val;

  void incrementQuantity(int amount) => quantity = quantity + amount;

  bool hasQuantity() => _quantity != null;

  static ItemsStruct fromMap(Map<String, dynamic> data) => ItemsStruct(
        descriptions: data['descriptions'] as String?,
        rate: castToType<double>(data['rate']),
        quantity: castToType<int>(data['quantity']),
      );

  static ItemsStruct? maybeFromMap(dynamic data) =>
      data is Map ? ItemsStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'descriptions': _descriptions,
        'rate': _rate,
        'quantity': _quantity,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'descriptions': serializeParam(
          _descriptions,
          ParamType.String,
        ),
        'rate': serializeParam(
          _rate,
          ParamType.double,
        ),
        'quantity': serializeParam(
          _quantity,
          ParamType.int,
        ),
      }.withoutNulls;

  static ItemsStruct fromSerializableMap(Map<String, dynamic> data) =>
      ItemsStruct(
        descriptions: deserializeParam(
          data['descriptions'],
          ParamType.String,
          false,
        ),
        rate: deserializeParam(
          data['rate'],
          ParamType.double,
          false,
        ),
        quantity: deserializeParam(
          data['quantity'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'ItemsStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ItemsStruct &&
        descriptions == other.descriptions &&
        rate == other.rate &&
        quantity == other.quantity;
  }

  @override
  int get hashCode => const ListEquality().hash([descriptions, rate, quantity]);
}

ItemsStruct createItemsStruct({
  String? descriptions,
  double? rate,
  int? quantity,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    ItemsStruct(
      descriptions: descriptions,
      rate: rate,
      quantity: quantity,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

ItemsStruct? updateItemsStruct(
  ItemsStruct? items, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    items
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addItemsStructData(
  Map<String, dynamic> firestoreData,
  ItemsStruct? items,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (items == null) {
    return;
  }
  if (items.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && items.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final itemsData = getItemsFirestoreData(items, forFieldValue);
  final nestedData = itemsData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = items.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getItemsFirestoreData(
  ItemsStruct? items, [
  bool forFieldValue = false,
]) {
  if (items == null) {
    return {};
  }
  final firestoreData = mapToFirestore(items.toMap());

  // Add any Firestore field values
  mapToFirestore(items.firestoreUtilData.fieldValues)
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getItemsListFirestoreData(
  List<ItemsStruct>? itemss,
) =>
    itemss?.map((e) => getItemsFirestoreData(e, true)).toList() ?? [];
