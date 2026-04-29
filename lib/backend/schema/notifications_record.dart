import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class NotificationsRecord extends FirestoreRecord {
  NotificationsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  bool hasTitle() => _title != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "createdby" field.
  DocumentReference? _createdby;
  DocumentReference? get createdby => _createdby;
  bool hasCreatedby() => _createdby != null;

  // "recievedby" field.
  DocumentReference? _recievedby;
  DocumentReference? get recievedby => _recievedby;
  bool hasRecievedby() => _recievedby != null;

  // "read" field.
  bool? _read;
  bool get read => _read ?? false;
  bool hasRead() => _read != null;

  // "readtime" field.
  DateTime? _readtime;
  DateTime? get readtime => _readtime;
  bool hasReadtime() => _readtime != null;

  void _initializeFields() {
    _title = snapshotData['title'] as String?;
    _description = snapshotData['description'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _createdby = snapshotData['createdby'] as DocumentReference?;
    _recievedby = snapshotData['recievedby'] as DocumentReference?;
    _read = snapshotData['read'] as bool?;
    _readtime = snapshotData['readtime'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('notifications');

  static Stream<NotificationsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => NotificationsRecord.fromSnapshot(s));

  static Future<NotificationsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => NotificationsRecord.fromSnapshot(s));

  static NotificationsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      NotificationsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static NotificationsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      NotificationsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'NotificationsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is NotificationsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createNotificationsRecordData({
  String? title,
  String? description,
  DateTime? createdTime,
  DocumentReference? createdby,
  DocumentReference? recievedby,
  bool? read,
  DateTime? readtime,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'title': title,
      'description': description,
      'created_time': createdTime,
      'createdby': createdby,
      'recievedby': recievedby,
      'read': read,
      'readtime': readtime,
    }.withoutNulls,
  );

  return firestoreData;
}

class NotificationsRecordDocumentEquality
    implements Equality<NotificationsRecord> {
  const NotificationsRecordDocumentEquality();

  @override
  bool equals(NotificationsRecord? e1, NotificationsRecord? e2) {
    return e1?.title == e2?.title &&
        e1?.description == e2?.description &&
        e1?.createdTime == e2?.createdTime &&
        e1?.createdby == e2?.createdby &&
        e1?.recievedby == e2?.recievedby &&
        e1?.read == e2?.read &&
        e1?.readtime == e2?.readtime;
  }

  @override
  int hash(NotificationsRecord? e) => const ListEquality().hash([
        e?.title,
        e?.description,
        e?.createdTime,
        e?.createdby,
        e?.recievedby,
        e?.read,
        e?.readtime
      ]);

  @override
  bool isValidKey(Object? o) => o is NotificationsRecord;
}
