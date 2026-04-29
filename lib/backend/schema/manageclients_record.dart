import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ManageclientsRecord extends FirestoreRecord {
  ManageclientsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "clientName" field.
  String? _clientName;
  String get clientName => _clientName ?? '';
  bool hasClientName() => _clientName != null;

  // "Email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "phoneNumber" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  bool hasPhoneNumber() => _phoneNumber != null;

  // "projectTitle" field.
  String? _projectTitle;
  String get projectTitle => _projectTitle ?? '';
  bool hasProjectTitle() => _projectTitle != null;

  // "projectDescription" field.
  String? _projectDescription;
  String get projectDescription => _projectDescription ?? '';
  bool hasProjectDescription() => _projectDescription != null;

  // "image" field.
  String? _image;
  String get image => _image ?? '';
  bool hasImage() => _image != null;

  // "userid" field.
  DocumentReference? _userid;
  DocumentReference? get userid => _userid;
  bool hasUserid() => _userid != null;

  // "dueDate" field.
  DateTime? _dueDate;
  DateTime? get dueDate => _dueDate;
  bool hasDueDate() => _dueDate != null;

  // "projectCreator" field.
  DocumentReference? _projectCreator;
  DocumentReference? get projectCreator => _projectCreator;
  bool hasProjectCreator() => _projectCreator != null;

  // "projectTeam" field.
  List<DocumentReference>? _projectTeam;
  List<DocumentReference> get projectTeam => _projectTeam ?? const [];
  bool hasProjectTeam() => _projectTeam != null;

  // "isActive" field.
  bool? _isActive;
  bool get isActive => _isActive ?? false;
  bool hasIsActive() => _isActive != null;

  // "totalAmount" field.
  int? _totalAmount;
  int get totalAmount => _totalAmount ?? 0;
  bool hasTotalAmount() => _totalAmount != null;

  void _initializeFields() {
    _clientName = snapshotData['clientName'] as String?;
    _email = snapshotData['Email'] as String?;
    _phoneNumber = snapshotData['phoneNumber'] as String?;
    _projectTitle = snapshotData['projectTitle'] as String?;
    _projectDescription = snapshotData['projectDescription'] as String?;
    _image = snapshotData['image'] as String?;
    _userid = snapshotData['userid'] as DocumentReference?;
    _dueDate = snapshotData['dueDate'] as DateTime?;
    _projectCreator = snapshotData['projectCreator'] as DocumentReference?;
    _projectTeam = getDataList(snapshotData['projectTeam']);
    _isActive = snapshotData['isActive'] as bool?;
    _totalAmount = castToType<int>(snapshotData['totalAmount']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('manageclients');

  static Stream<ManageclientsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ManageclientsRecord.fromSnapshot(s));

  static Future<ManageclientsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ManageclientsRecord.fromSnapshot(s));

  static ManageclientsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ManageclientsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ManageclientsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ManageclientsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ManageclientsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ManageclientsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createManageclientsRecordData({
  String? clientName,
  String? email,
  String? phoneNumber,
  String? projectTitle,
  String? projectDescription,
  String? image,
  DocumentReference? userid,
  DateTime? dueDate,
  DocumentReference? projectCreator,
  bool? isActive,
  int? totalAmount,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'clientName': clientName,
      'Email': email,
      'phoneNumber': phoneNumber,
      'projectTitle': projectTitle,
      'projectDescription': projectDescription,
      'image': image,
      'userid': userid,
      'dueDate': dueDate,
      'projectCreator': projectCreator,
      'isActive': isActive,
      'totalAmount': totalAmount,
    }.withoutNulls,
  );

  return firestoreData;
}

class ManageclientsRecordDocumentEquality
    implements Equality<ManageclientsRecord> {
  const ManageclientsRecordDocumentEquality();

  @override
  bool equals(ManageclientsRecord? e1, ManageclientsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.clientName == e2?.clientName &&
        e1?.email == e2?.email &&
        e1?.phoneNumber == e2?.phoneNumber &&
        e1?.projectTitle == e2?.projectTitle &&
        e1?.projectDescription == e2?.projectDescription &&
        e1?.image == e2?.image &&
        e1?.userid == e2?.userid &&
        e1?.dueDate == e2?.dueDate &&
        e1?.projectCreator == e2?.projectCreator &&
        listEquality.equals(e1?.projectTeam, e2?.projectTeam) &&
        e1?.isActive == e2?.isActive &&
        e1?.totalAmount == e2?.totalAmount;
  }

  @override
  int hash(ManageclientsRecord? e) => const ListEquality().hash([
        e?.clientName,
        e?.email,
        e?.phoneNumber,
        e?.projectTitle,
        e?.projectDescription,
        e?.image,
        e?.userid,
        e?.dueDate,
        e?.projectCreator,
        e?.projectTeam,
        e?.isActive,
        e?.totalAmount
      ]);

  @override
  bool isValidKey(Object? o) => o is ManageclientsRecord;
}
