import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TasksRecord extends FirestoreRecord {
  TasksRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "taskTitle" field.
  String? _taskTitle;
  String get taskTitle => _taskTitle ?? '';
  bool hasTaskTitle() => _taskTitle != null;

  // "taskDetail" field.
  String? _taskDetail;
  String get taskDetail => _taskDetail ?? '';
  bool hasTaskDetail() => _taskDetail != null;

  // "completedFlag" field.
  bool? _completedFlag;
  bool get completedFlag => _completedFlag ?? false;
  bool hasCompletedFlag() => _completedFlag != null;

  // "dueDate" field.
  DateTime? _dueDate;
  DateTime? get dueDate => _dueDate;
  bool hasDueDate() => _dueDate != null;

  // "plansRef" field.
  DocumentReference? _plansRef;
  DocumentReference? get plansRef => _plansRef;
  bool hasPlansRef() => _plansRef != null;

  // "taskAssigned" field.
  DocumentReference? _taskAssigned;
  DocumentReference? get taskAssigned => _taskAssigned;
  bool hasTaskAssigned() => _taskAssigned != null;

  // "manageClientsRef" field.
  DocumentReference? _manageClientsRef;
  DocumentReference? get manageClientsRef => _manageClientsRef;
  bool hasManageClientsRef() => _manageClientsRef != null;

  // "completedDate" field.
  DateTime? _completedDate;
  DateTime? get completedDate => _completedDate;
  bool hasCompletedDate() => _completedDate != null;

  // "userid" field.
  DocumentReference? _userid;
  DocumentReference? get userid => _userid;
  bool hasUserid() => _userid != null;

  // "ref" field.
  DocumentReference? _ref;
  DocumentReference? get ref => _ref;
  bool hasRef() => _ref != null;

  void _initializeFields() {
    _taskTitle = snapshotData['taskTitle'] as String?;
    _taskDetail = snapshotData['taskDetail'] as String?;
    _completedFlag = snapshotData['completedFlag'] as bool?;
    _dueDate = snapshotData['dueDate'] as DateTime?;
    _plansRef = snapshotData['plansRef'] as DocumentReference?;
    _taskAssigned = snapshotData['taskAssigned'] as DocumentReference?;
    _manageClientsRef = snapshotData['manageClientsRef'] as DocumentReference?;
    _completedDate = snapshotData['completedDate'] as DateTime?;
    _userid = snapshotData['userid'] as DocumentReference?;
    _ref = snapshotData['ref'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('tasks');

  static Stream<TasksRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => TasksRecord.fromSnapshot(s));

  static Future<TasksRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => TasksRecord.fromSnapshot(s));

  static TasksRecord fromSnapshot(DocumentSnapshot snapshot) => TasksRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static TasksRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      TasksRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'TasksRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is TasksRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createTasksRecordData({
  String? taskTitle,
  String? taskDetail,
  bool? completedFlag,
  DateTime? dueDate,
  DocumentReference? plansRef,
  DocumentReference? taskAssigned,
  DocumentReference? manageClientsRef,
  DateTime? completedDate,
  DocumentReference? userid,
  DocumentReference? ref,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'taskTitle': taskTitle,
      'taskDetail': taskDetail,
      'completedFlag': completedFlag,
      'dueDate': dueDate,
      'plansRef': plansRef,
      'taskAssigned': taskAssigned,
      'manageClientsRef': manageClientsRef,
      'completedDate': completedDate,
      'userid': userid,
      'ref': ref,
    }.withoutNulls,
  );

  return firestoreData;
}

class TasksRecordDocumentEquality implements Equality<TasksRecord> {
  const TasksRecordDocumentEquality();

  @override
  bool equals(TasksRecord? e1, TasksRecord? e2) {
    return e1?.taskTitle == e2?.taskTitle &&
        e1?.taskDetail == e2?.taskDetail &&
        e1?.completedFlag == e2?.completedFlag &&
        e1?.dueDate == e2?.dueDate &&
        e1?.plansRef == e2?.plansRef &&
        e1?.taskAssigned == e2?.taskAssigned &&
        e1?.manageClientsRef == e2?.manageClientsRef &&
        e1?.completedDate == e2?.completedDate &&
        e1?.userid == e2?.userid &&
        e1?.ref == e2?.ref;
  }

  @override
  int hash(TasksRecord? e) => const ListEquality().hash([
        e?.taskTitle,
        e?.taskDetail,
        e?.completedFlag,
        e?.dueDate,
        e?.plansRef,
        e?.taskAssigned,
        e?.manageClientsRef,
        e?.completedDate,
        e?.userid,
        e?.ref
      ]);

  @override
  bool isValidKey(Object? o) => o is TasksRecord;
}
