import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MeditationRecord extends FirestoreRecord {
  MeditationRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "timerSeconds" field.
  int? _timerSeconds;
  int get timerSeconds => _timerSeconds ?? 0;
  bool hasTimerSeconds() => _timerSeconds != null;

  // "isStartedTimer" field.
  bool? _isStartedTimer;
  bool get isStartedTimer => _isStartedTimer ?? false;
  bool hasIsStartedTimer() => _isStartedTimer != null;

  // "userRef" field.
  DocumentReference? _userRef;
  DocumentReference? get userRef => _userRef;
  bool hasUserRef() => _userRef != null;

  // "startedAt" field.
  DateTime? _startedAt;
  DateTime? get startedAt => _startedAt;
  bool hasStartedAt() => _startedAt != null;

  void _initializeFields() {
    _timerSeconds = castToType<int>(snapshotData['timerSeconds']);
    _isStartedTimer = snapshotData['isStartedTimer'] as bool?;
    _userRef = snapshotData['userRef'] as DocumentReference?;
    _startedAt = snapshotData['startedAt'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('meditation');

  static Stream<MeditationRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => MeditationRecord.fromSnapshot(s));

  static Future<MeditationRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => MeditationRecord.fromSnapshot(s));

  static MeditationRecord fromSnapshot(DocumentSnapshot snapshot) =>
      MeditationRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static MeditationRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      MeditationRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'MeditationRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is MeditationRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createMeditationRecordData({
  int? timerSeconds,
  bool? isStartedTimer,
  DocumentReference? userRef,
  DateTime? startedAt,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'timerSeconds': timerSeconds,
      'isStartedTimer': isStartedTimer,
      'userRef': userRef,
      'startedAt': startedAt,
    }.withoutNulls,
  );

  return firestoreData;
}

class MeditationRecordDocumentEquality implements Equality<MeditationRecord> {
  const MeditationRecordDocumentEquality();

  @override
  bool equals(MeditationRecord? e1, MeditationRecord? e2) {
    return e1?.timerSeconds == e2?.timerSeconds &&
        e1?.isStartedTimer == e2?.isStartedTimer &&
        e1?.userRef == e2?.userRef &&
        e1?.startedAt == e2?.startedAt;
  }

  @override
  int hash(MeditationRecord? e) => const ListEquality()
      .hash([e?.timerSeconds, e?.isStartedTimer, e?.userRef, e?.startedAt]);

  @override
  bool isValidKey(Object? o) => o is MeditationRecord;
}
