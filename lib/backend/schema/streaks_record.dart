import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class StreaksRecord extends FirestoreRecord {
  StreaksRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "userRef" field.
  DocumentReference? _userRef;
  DocumentReference? get userRef => _userRef;
  bool hasUserRef() => _userRef != null;

  // "streakCount" field.
  int? _streakCount;
  int get streakCount => _streakCount ?? 0;
  bool hasStreakCount() => _streakCount != null;

  // "lastEntryDate" field.
  DateTime? _lastEntryDate;
  DateTime? get lastEntryDate => _lastEntryDate;
  bool hasLastEntryDate() => _lastEntryDate != null;

  void _initializeFields() {
    _userRef = snapshotData['userRef'] as DocumentReference?;
    _streakCount = castToType<int>(snapshotData['streakCount']);
    _lastEntryDate = snapshotData['lastEntryDate'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('streaks');

  static Stream<StreaksRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => StreaksRecord.fromSnapshot(s));

  static Future<StreaksRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => StreaksRecord.fromSnapshot(s));

  static StreaksRecord fromSnapshot(DocumentSnapshot snapshot) =>
      StreaksRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static StreaksRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      StreaksRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'StreaksRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is StreaksRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createStreaksRecordData({
  DocumentReference? userRef,
  int? streakCount,
  DateTime? lastEntryDate,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'userRef': userRef,
      'streakCount': streakCount,
      'lastEntryDate': lastEntryDate,
    }.withoutNulls,
  );

  return firestoreData;
}

class StreaksRecordDocumentEquality implements Equality<StreaksRecord> {
  const StreaksRecordDocumentEquality();

  @override
  bool equals(StreaksRecord? e1, StreaksRecord? e2) {
    return e1?.userRef == e2?.userRef &&
        e1?.streakCount == e2?.streakCount &&
        e1?.lastEntryDate == e2?.lastEntryDate;
  }

  @override
  int hash(StreaksRecord? e) =>
      const ListEquality().hash([e?.userRef, e?.streakCount, e?.lastEntryDate]);

  @override
  bool isValidKey(Object? o) => o is StreaksRecord;
}
