import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ClientsRecord extends FirestoreRecord {
  ClientsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "user_ref" field.
  DocumentReference? _userRef;
  DocumentReference? get userRef => _userRef;
  bool hasUserRef() => _userRef != null;

  // "business_name" field.
  String? _businessName;
  String get businessName => _businessName ?? '';
  bool hasBusinessName() => _businessName != null;

  // "client_name" field.
  String? _clientName;
  String get clientName => _clientName ?? '';
  bool hasClientName() => _clientName != null;

  // "client_address" field.
  String? _clientAddress;
  String get clientAddress => _clientAddress ?? '';
  bool hasClientAddress() => _clientAddress != null;

  // "tax_number" field.
  String? _taxNumber;
  String get taxNumber => _taxNumber ?? '';
  bool hasTaxNumber() => _taxNumber != null;

  // "displayname" field.
  String? _displayname;
  String get displayname => _displayname ?? '';
  bool hasDisplayname() => _displayname != null;

  void _initializeFields() {
    _userRef = snapshotData['user_ref'] as DocumentReference?;
    _businessName = snapshotData['business_name'] as String?;
    _clientName = snapshotData['client_name'] as String?;
    _clientAddress = snapshotData['client_address'] as String?;
    _taxNumber = snapshotData['tax_number'] as String?;
    _displayname = snapshotData['displayname'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('clients');

  static Stream<ClientsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ClientsRecord.fromSnapshot(s));

  static Future<ClientsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ClientsRecord.fromSnapshot(s));

  static ClientsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ClientsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ClientsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ClientsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ClientsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ClientsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createClientsRecordData({
  DocumentReference? userRef,
  String? businessName,
  String? clientName,
  String? clientAddress,
  String? taxNumber,
  String? displayname,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'user_ref': userRef,
      'business_name': businessName,
      'client_name': clientName,
      'client_address': clientAddress,
      'tax_number': taxNumber,
      'displayname': displayname,
    }.withoutNulls,
  );

  return firestoreData;
}

class ClientsRecordDocumentEquality implements Equality<ClientsRecord> {
  const ClientsRecordDocumentEquality();

  @override
  bool equals(ClientsRecord? e1, ClientsRecord? e2) {
    return e1?.userRef == e2?.userRef &&
        e1?.businessName == e2?.businessName &&
        e1?.clientName == e2?.clientName &&
        e1?.clientAddress == e2?.clientAddress &&
        e1?.taxNumber == e2?.taxNumber &&
        e1?.displayname == e2?.displayname;
  }

  @override
  int hash(ClientsRecord? e) => const ListEquality().hash([
        e?.userRef,
        e?.businessName,
        e?.clientName,
        e?.clientAddress,
        e?.taxNumber,
        e?.displayname
      ]);

  @override
  bool isValidKey(Object? o) => o is ClientsRecord;
}
