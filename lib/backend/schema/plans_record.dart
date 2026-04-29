import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PlansRecord extends FirestoreRecord {
  PlansRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  bool hasTitle() => _title != null;

  // "details" field.
  String? _details;
  String get details => _details ?? '';
  bool hasDetails() => _details != null;

  // "dueDate" field.
  DateTime? _dueDate;
  DateTime? get dueDate => _dueDate;
  bool hasDueDate() => _dueDate != null;

  // "manageClientsRef" field.
  DocumentReference? _manageClientsRef;
  DocumentReference? get manageClientsRef => _manageClientsRef;
  bool hasManageClientsRef() => _manageClientsRef != null;

  // "userid" field.
  DocumentReference? _userid;
  DocumentReference? get userid => _userid;
  bool hasUserid() => _userid != null;

  void _initializeFields() {
    _title = snapshotData['title'] as String?;
    _details = snapshotData['details'] as String?;
    _dueDate = snapshotData['dueDate'] as DateTime?;
    _manageClientsRef = snapshotData['manageClientsRef'] as DocumentReference?;
    _userid = snapshotData['userid'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Plans');

  static Stream<PlansRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => PlansRecord.fromSnapshot(s));

  static Future<PlansRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => PlansRecord.fromSnapshot(s));

  static PlansRecord fromSnapshot(DocumentSnapshot snapshot) => PlansRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static PlansRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      PlansRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'PlansRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is PlansRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createPlansRecordData({
  String? title,
  String? details,
  DateTime? dueDate,
  DocumentReference? manageClientsRef,
  DocumentReference? userid,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'title': title,
      'details': details,
      'dueDate': dueDate,
      'manageClientsRef': manageClientsRef,
      'userid': userid,
    }.withoutNulls,
  );

  return firestoreData;
}

class PlansRecordDocumentEquality implements Equality<PlansRecord> {
  const PlansRecordDocumentEquality();

  @override
  bool equals(PlansRecord? e1, PlansRecord? e2) {
    return e1?.title == e2?.title &&
        e1?.details == e2?.details &&
        e1?.dueDate == e2?.dueDate &&
        e1?.manageClientsRef == e2?.manageClientsRef &&
        e1?.userid == e2?.userid;
  }

  @override
  int hash(PlansRecord? e) => const ListEquality()
      .hash([e?.title, e?.details, e?.dueDate, e?.manageClientsRef, e?.userid]);

  @override
  bool isValidKey(Object? o) => o is PlansRecord;
}
