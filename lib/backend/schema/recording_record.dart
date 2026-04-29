import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class RecordingRecord extends FirestoreRecord {
  RecordingRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "Title" field.
  String? _title;
  String get title => _title ?? '';
  bool hasTitle() => _title != null;

  // "voicenotes" field.
  VoiceNotesASStruct? _voicenotes;
  VoiceNotesASStruct get voicenotes => _voicenotes ?? VoiceNotesASStruct();
  bool hasVoicenotes() => _voicenotes != null;

  void _initializeFields() {
    _title = snapshotData['Title'] as String?;
    _voicenotes = snapshotData['voicenotes'] is VoiceNotesASStruct
        ? snapshotData['voicenotes']
        : VoiceNotesASStruct.maybeFromMap(snapshotData['voicenotes']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Recording');

  static Stream<RecordingRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => RecordingRecord.fromSnapshot(s));

  static Future<RecordingRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => RecordingRecord.fromSnapshot(s));

  static RecordingRecord fromSnapshot(DocumentSnapshot snapshot) =>
      RecordingRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static RecordingRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      RecordingRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'RecordingRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is RecordingRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createRecordingRecordData({
  String? title,
  VoiceNotesASStruct? voicenotes,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'Title': title,
      'voicenotes': VoiceNotesASStruct().toMap(),
    }.withoutNulls,
  );

  // Handle nested data for "voicenotes" field.
  addVoiceNotesASStructData(firestoreData, voicenotes, 'voicenotes');

  return firestoreData;
}

class RecordingRecordDocumentEquality implements Equality<RecordingRecord> {
  const RecordingRecordDocumentEquality();

  @override
  bool equals(RecordingRecord? e1, RecordingRecord? e2) {
    return e1?.title == e2?.title && e1?.voicenotes == e2?.voicenotes;
  }

  @override
  int hash(RecordingRecord? e) =>
      const ListEquality().hash([e?.title, e?.voicenotes]);

  @override
  bool isValidKey(Object? o) => o is RecordingRecord;
}
