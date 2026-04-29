import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class JournalentriesCollectionRecord extends FirestoreRecord {
  JournalentriesCollectionRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "owner" field.
  DocumentReference? _owner;
  DocumentReference? get owner => _owner;
  bool hasOwner() => _owner != null;

  // "project_name" field.
  String? _projectName;
  String get projectName => _projectName ?? '';
  bool hasProjectName() => _projectName != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "number_tasks" field.
  int? _numberTasks;
  int get numberTasks => _numberTasks ?? 0;
  bool hasNumberTasks() => _numberTasks != null;

  // "completed_tasks" field.
  int? _completedTasks;
  int get completedTasks => _completedTasks ?? 0;
  bool hasCompletedTasks() => _completedTasks != null;

  // "last_edited" field.
  DateTime? _lastEdited;
  DateTime? get lastEdited => _lastEdited;
  bool hasLastEdited() => _lastEdited != null;

  // "Mood" field.
  String? _mood;
  String get mood => _mood ?? '';
  bool hasMood() => _mood != null;

  // "user_id" field.
  DocumentReference? _userId;
  DocumentReference? get userId => _userId;
  bool hasUserId() => _userId != null;

  // "entry_date" field.
  DateTime? _entryDate;
  DateTime? get entryDate => _entryDate;
  bool hasEntryDate() => _entryDate != null;

  // "time_created" field.
  DateTime? _timeCreated;
  DateTime? get timeCreated => _timeCreated;
  bool hasTimeCreated() => _timeCreated != null;

  void _initializeFields() {
    _owner = snapshotData['owner'] as DocumentReference?;
    _projectName = snapshotData['project_name'] as String?;
    _description = snapshotData['description'] as String?;
    _numberTasks = castToType<int>(snapshotData['number_tasks']);
    _completedTasks = castToType<int>(snapshotData['completed_tasks']);
    _lastEdited = snapshotData['last_edited'] as DateTime?;
    _mood = snapshotData['Mood'] as String?;
    _userId = snapshotData['user_id'] as DocumentReference?;
    _entryDate = snapshotData['entry_date'] as DateTime?;
    _timeCreated = snapshotData['time_created'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('JournalentriesCollection');

  static Stream<JournalentriesCollectionRecord> getDocument(
          DocumentReference ref) =>
      ref
          .snapshots()
          .map((s) => JournalentriesCollectionRecord.fromSnapshot(s));

  static Future<JournalentriesCollectionRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => JournalentriesCollectionRecord.fromSnapshot(s));

  static JournalentriesCollectionRecord fromSnapshot(
          DocumentSnapshot snapshot) =>
      JournalentriesCollectionRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static JournalentriesCollectionRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      JournalentriesCollectionRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'JournalentriesCollectionRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is JournalentriesCollectionRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createJournalentriesCollectionRecordData({
  DocumentReference? owner,
  String? projectName,
  String? description,
  int? numberTasks,
  int? completedTasks,
  DateTime? lastEdited,
  String? mood,
  DocumentReference? userId,
  DateTime? entryDate,
  DateTime? timeCreated,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'owner': owner,
      'project_name': projectName,
      'description': description,
      'number_tasks': numberTasks,
      'completed_tasks': completedTasks,
      'last_edited': lastEdited,
      'Mood': mood,
      'user_id': userId,
      'entry_date': entryDate,
      'time_created': timeCreated,
    }.withoutNulls,
  );

  return firestoreData;
}

class JournalentriesCollectionRecordDocumentEquality
    implements Equality<JournalentriesCollectionRecord> {
  const JournalentriesCollectionRecordDocumentEquality();

  @override
  bool equals(
      JournalentriesCollectionRecord? e1, JournalentriesCollectionRecord? e2) {
    return e1?.owner == e2?.owner &&
        e1?.projectName == e2?.projectName &&
        e1?.description == e2?.description &&
        e1?.numberTasks == e2?.numberTasks &&
        e1?.completedTasks == e2?.completedTasks &&
        e1?.lastEdited == e2?.lastEdited &&
        e1?.mood == e2?.mood &&
        e1?.userId == e2?.userId &&
        e1?.entryDate == e2?.entryDate &&
        e1?.timeCreated == e2?.timeCreated;
  }

  @override
  int hash(JournalentriesCollectionRecord? e) => const ListEquality().hash([
        e?.owner,
        e?.projectName,
        e?.description,
        e?.numberTasks,
        e?.completedTasks,
        e?.lastEdited,
        e?.mood,
        e?.userId,
        e?.entryDate,
        e?.timeCreated
      ]);

  @override
  bool isValidKey(Object? o) => o is JournalentriesCollectionRecord;
}
