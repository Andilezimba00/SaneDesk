// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class VoiceNotesASStruct extends FFFirebaseStruct {
  VoiceNotesASStruct({
    String? audioPath,
    DateTime? createdAt,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _audioPath = audioPath,
        _createdAt = createdAt,
        super(firestoreUtilData);

  // "audioPath" field.
  String? _audioPath;
  String get audioPath => _audioPath ?? '';
  set audioPath(String? val) => _audioPath = val;

  bool hasAudioPath() => _audioPath != null;

  // "createdAt" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  set createdAt(DateTime? val) => _createdAt = val;

  bool hasCreatedAt() => _createdAt != null;

  static VoiceNotesASStruct fromMap(Map<String, dynamic> data) =>
      VoiceNotesASStruct(
        audioPath: data['audioPath'] as String?,
        createdAt: data['createdAt'] as DateTime?,
      );

  static VoiceNotesASStruct? maybeFromMap(dynamic data) => data is Map
      ? VoiceNotesASStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'audioPath': _audioPath,
        'createdAt': _createdAt,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'audioPath': serializeParam(
          _audioPath,
          ParamType.String,
        ),
        'createdAt': serializeParam(
          _createdAt,
          ParamType.DateTime,
        ),
      }.withoutNulls;

  static VoiceNotesASStruct fromSerializableMap(Map<String, dynamic> data) =>
      VoiceNotesASStruct(
        audioPath: deserializeParam(
          data['audioPath'],
          ParamType.String,
          false,
        ),
        createdAt: deserializeParam(
          data['createdAt'],
          ParamType.DateTime,
          false,
        ),
      );

  @override
  String toString() => 'VoiceNotesASStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is VoiceNotesASStruct &&
        audioPath == other.audioPath &&
        createdAt == other.createdAt;
  }

  @override
  int get hashCode => const ListEquality().hash([audioPath, createdAt]);
}

VoiceNotesASStruct createVoiceNotesASStruct({
  String? audioPath,
  DateTime? createdAt,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    VoiceNotesASStruct(
      audioPath: audioPath,
      createdAt: createdAt,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

VoiceNotesASStruct? updateVoiceNotesASStruct(
  VoiceNotesASStruct? voiceNotesAS, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    voiceNotesAS
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addVoiceNotesASStructData(
  Map<String, dynamic> firestoreData,
  VoiceNotesASStruct? voiceNotesAS,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (voiceNotesAS == null) {
    return;
  }
  if (voiceNotesAS.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && voiceNotesAS.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final voiceNotesASData =
      getVoiceNotesASFirestoreData(voiceNotesAS, forFieldValue);
  final nestedData =
      voiceNotesASData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = voiceNotesAS.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getVoiceNotesASFirestoreData(
  VoiceNotesASStruct? voiceNotesAS, [
  bool forFieldValue = false,
]) {
  if (voiceNotesAS == null) {
    return {};
  }
  final firestoreData = mapToFirestore(voiceNotesAS.toMap());

  // Add any Firestore field values
  mapToFirestore(voiceNotesAS.firestoreUtilData.fieldValues)
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getVoiceNotesASListFirestoreData(
  List<VoiceNotesASStruct>? voiceNotesASs,
) =>
    voiceNotesASs?.map((e) => getVoiceNotesASFirestoreData(e, true)).toList() ??
    [];
