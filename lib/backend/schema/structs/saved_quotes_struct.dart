// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class SavedQuotesStruct extends FFFirebaseStruct {
  SavedQuotesStruct({
    String? quoteText,
    String? authorName,
    String? authorImage,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _quoteText = quoteText,
        _authorName = authorName,
        _authorImage = authorImage,
        super(firestoreUtilData);

  // "quoteText" field.
  String? _quoteText;
  String get quoteText => _quoteText ?? '';
  set quoteText(String? val) => _quoteText = val;

  bool hasQuoteText() => _quoteText != null;

  // "authorName" field.
  String? _authorName;
  String get authorName => _authorName ?? '';
  set authorName(String? val) => _authorName = val;

  bool hasAuthorName() => _authorName != null;

  // "authorImage" field.
  String? _authorImage;
  String get authorImage => _authorImage ?? '';
  set authorImage(String? val) => _authorImage = val;

  bool hasAuthorImage() => _authorImage != null;

  static SavedQuotesStruct fromMap(Map<String, dynamic> data) =>
      SavedQuotesStruct(
        quoteText: data['quoteText'] as String?,
        authorName: data['authorName'] as String?,
        authorImage: data['authorImage'] as String?,
      );

  static SavedQuotesStruct? maybeFromMap(dynamic data) => data is Map
      ? SavedQuotesStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'quoteText': _quoteText,
        'authorName': _authorName,
        'authorImage': _authorImage,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'quoteText': serializeParam(
          _quoteText,
          ParamType.String,
        ),
        'authorName': serializeParam(
          _authorName,
          ParamType.String,
        ),
        'authorImage': serializeParam(
          _authorImage,
          ParamType.String,
        ),
      }.withoutNulls;

  static SavedQuotesStruct fromSerializableMap(Map<String, dynamic> data) =>
      SavedQuotesStruct(
        quoteText: deserializeParam(
          data['quoteText'],
          ParamType.String,
          false,
        ),
        authorName: deserializeParam(
          data['authorName'],
          ParamType.String,
          false,
        ),
        authorImage: deserializeParam(
          data['authorImage'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'SavedQuotesStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is SavedQuotesStruct &&
        quoteText == other.quoteText &&
        authorName == other.authorName &&
        authorImage == other.authorImage;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([quoteText, authorName, authorImage]);
}

SavedQuotesStruct createSavedQuotesStruct({
  String? quoteText,
  String? authorName,
  String? authorImage,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    SavedQuotesStruct(
      quoteText: quoteText,
      authorName: authorName,
      authorImage: authorImage,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

SavedQuotesStruct? updateSavedQuotesStruct(
  SavedQuotesStruct? savedQuotes, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    savedQuotes
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addSavedQuotesStructData(
  Map<String, dynamic> firestoreData,
  SavedQuotesStruct? savedQuotes,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (savedQuotes == null) {
    return;
  }
  if (savedQuotes.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && savedQuotes.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final savedQuotesData =
      getSavedQuotesFirestoreData(savedQuotes, forFieldValue);
  final nestedData =
      savedQuotesData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = savedQuotes.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getSavedQuotesFirestoreData(
  SavedQuotesStruct? savedQuotes, [
  bool forFieldValue = false,
]) {
  if (savedQuotes == null) {
    return {};
  }
  final firestoreData = mapToFirestore(savedQuotes.toMap());

  // Add any Firestore field values
  mapToFirestore(savedQuotes.firestoreUtilData.fieldValues)
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getSavedQuotesListFirestoreData(
  List<SavedQuotesStruct>? savedQuotess,
) =>
    savedQuotess?.map((e) => getSavedQuotesFirestoreData(e, true)).toList() ??
    [];
