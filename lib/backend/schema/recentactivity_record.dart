import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class RecentactivityRecord extends FirestoreRecord {
  RecentactivityRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "userref" field.
  DocumentReference? _userref;
  DocumentReference? get userref => _userref;
  bool hasUserref() => _userref != null;

  // "meditationsec" field.
  DocumentReference? _meditationsec;
  DocumentReference? get meditationsec => _meditationsec;
  bool hasMeditationsec() => _meditationsec != null;

  // "numClients" field.
  DocumentReference? _numClients;
  DocumentReference? get numClients => _numClients;
  bool hasNumClients() => _numClients != null;

  // "journalstreak" field.
  DocumentReference? _journalstreak;
  DocumentReference? get journalstreak => _journalstreak;
  bool hasJournalstreak() => _journalstreak != null;

  void _initializeFields() {
    _userref = snapshotData['userref'] as DocumentReference?;
    _meditationsec = snapshotData['meditationsec'] as DocumentReference?;
    _numClients = snapshotData['numClients'] as DocumentReference?;
    _journalstreak = snapshotData['journalstreak'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Recentactivity');

  static Stream<RecentactivityRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => RecentactivityRecord.fromSnapshot(s));

  static Future<RecentactivityRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => RecentactivityRecord.fromSnapshot(s));

  static RecentactivityRecord fromSnapshot(DocumentSnapshot snapshot) =>
      RecentactivityRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static RecentactivityRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      RecentactivityRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'RecentactivityRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is RecentactivityRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createRecentactivityRecordData({
  DocumentReference? userref,
  DocumentReference? meditationsec,
  DocumentReference? numClients,
  DocumentReference? journalstreak,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'userref': userref,
      'meditationsec': meditationsec,
      'numClients': numClients,
      'journalstreak': journalstreak,
    }.withoutNulls,
  );

  return firestoreData;
}

class RecentactivityRecordDocumentEquality
    implements Equality<RecentactivityRecord> {
  const RecentactivityRecordDocumentEquality();

  @override
  bool equals(RecentactivityRecord? e1, RecentactivityRecord? e2) {
    return e1?.userref == e2?.userref &&
        e1?.meditationsec == e2?.meditationsec &&
        e1?.numClients == e2?.numClients &&
        e1?.journalstreak == e2?.journalstreak;
  }

  @override
  int hash(RecentactivityRecord? e) => const ListEquality()
      .hash([e?.userref, e?.meditationsec, e?.numClients, e?.journalstreak]);

  @override
  bool isValidKey(Object? o) => o is RecentactivityRecord;
}
