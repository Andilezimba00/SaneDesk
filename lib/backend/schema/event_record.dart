import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class EventRecord extends FirestoreRecord {
  EventRecord._(
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

  // "date" field.
  DateTime? _date;
  DateTime? get date => _date;
  bool hasDate() => _date != null;

  // "place" field.
  String? _place;
  String get place => _place ?? '';
  bool hasPlace() => _place != null;

  // "categoryref" field.
  String? _categoryref;
  String get categoryref => _categoryref ?? '';
  bool hasCategoryref() => _categoryref != null;

  // "joined" field.
  List<DocumentReference>? _joined;
  List<DocumentReference> get joined => _joined ?? const [];
  bool hasJoined() => _joined != null;

  // "Image" field.
  String? _image;
  String get image => _image ?? '';
  bool hasImage() => _image != null;

  // "userid" field.
  DocumentReference? _userid;
  DocumentReference? get userid => _userid;
  bool hasUserid() => _userid != null;

  // "userreference" field.
  DocumentReference? _userreference;
  DocumentReference? get userreference => _userreference;
  bool hasUserreference() => _userreference != null;

  void _initializeFields() {
    _title = snapshotData['title'] as String?;
    _description = snapshotData['description'] as String?;
    _date = snapshotData['date'] as DateTime?;
    _place = snapshotData['place'] as String?;
    _categoryref = snapshotData['categoryref'] as String?;
    _joined = getDataList(snapshotData['joined']);
    _image = snapshotData['Image'] as String?;
    _userid = snapshotData['userid'] as DocumentReference?;
    _userreference = snapshotData['userreference'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('event');

  static Stream<EventRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => EventRecord.fromSnapshot(s));

  static Future<EventRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => EventRecord.fromSnapshot(s));

  static EventRecord fromSnapshot(DocumentSnapshot snapshot) => EventRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static EventRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      EventRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'EventRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is EventRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createEventRecordData({
  String? title,
  String? description,
  DateTime? date,
  String? place,
  String? categoryref,
  String? image,
  DocumentReference? userid,
  DocumentReference? userreference,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'title': title,
      'description': description,
      'date': date,
      'place': place,
      'categoryref': categoryref,
      'Image': image,
      'userid': userid,
      'userreference': userreference,
    }.withoutNulls,
  );

  return firestoreData;
}

class EventRecordDocumentEquality implements Equality<EventRecord> {
  const EventRecordDocumentEquality();

  @override
  bool equals(EventRecord? e1, EventRecord? e2) {
    const listEquality = ListEquality();
    return e1?.title == e2?.title &&
        e1?.description == e2?.description &&
        e1?.date == e2?.date &&
        e1?.place == e2?.place &&
        e1?.categoryref == e2?.categoryref &&
        listEquality.equals(e1?.joined, e2?.joined) &&
        e1?.image == e2?.image &&
        e1?.userid == e2?.userid &&
        e1?.userreference == e2?.userreference;
  }

  @override
  int hash(EventRecord? e) => const ListEquality().hash([
        e?.title,
        e?.description,
        e?.date,
        e?.place,
        e?.categoryref,
        e?.joined,
        e?.image,
        e?.userid,
        e?.userreference
      ]);

  @override
  bool isValidKey(Object? o) => o is EventRecord;
}
