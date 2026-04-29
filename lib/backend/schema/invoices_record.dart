import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class InvoicesRecord extends FirestoreRecord {
  InvoicesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "user_ref" field.
  DocumentReference? _userRef;
  DocumentReference? get userRef => _userRef;
  bool hasUserRef() => _userRef != null;

  // "client_ref" field.
  DocumentReference? _clientRef;
  DocumentReference? get clientRef => _clientRef;
  bool hasClientRef() => _clientRef != null;

  // "invoice_number" field.
  int? _invoiceNumber;
  int get invoiceNumber => _invoiceNumber ?? 0;
  bool hasInvoiceNumber() => _invoiceNumber != null;

  // "invoice_date" field.
  DateTime? _invoiceDate;
  DateTime? get invoiceDate => _invoiceDate;
  bool hasInvoiceDate() => _invoiceDate != null;

  // "invoice_due_date" field.
  DateTime? _invoiceDueDate;
  DateTime? get invoiceDueDate => _invoiceDueDate;
  bool hasInvoiceDueDate() => _invoiceDueDate != null;

  // "invoice_notes" field.
  String? _invoiceNotes;
  String get invoiceNotes => _invoiceNotes ?? '';
  bool hasInvoiceNotes() => _invoiceNotes != null;

  // "ispaid" field.
  bool? _ispaid;
  bool get ispaid => _ispaid ?? false;
  bool hasIspaid() => _ispaid != null;

  // "invoice_items" field.
  List<ItemsStruct>? _invoiceItems;
  List<ItemsStruct> get invoiceItems => _invoiceItems ?? const [];
  bool hasInvoiceItems() => _invoiceItems != null;

  void _initializeFields() {
    _userRef = snapshotData['user_ref'] as DocumentReference?;
    _clientRef = snapshotData['client_ref'] as DocumentReference?;
    _invoiceNumber = castToType<int>(snapshotData['invoice_number']);
    _invoiceDate = snapshotData['invoice_date'] as DateTime?;
    _invoiceDueDate = snapshotData['invoice_due_date'] as DateTime?;
    _invoiceNotes = snapshotData['invoice_notes'] as String?;
    _ispaid = snapshotData['ispaid'] as bool?;
    _invoiceItems = getStructList(
      snapshotData['invoice_items'],
      ItemsStruct.fromMap,
    );
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('invoices');

  static Stream<InvoicesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => InvoicesRecord.fromSnapshot(s));

  static Future<InvoicesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => InvoicesRecord.fromSnapshot(s));

  static InvoicesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      InvoicesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static InvoicesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      InvoicesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'InvoicesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is InvoicesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createInvoicesRecordData({
  DocumentReference? userRef,
  DocumentReference? clientRef,
  int? invoiceNumber,
  DateTime? invoiceDate,
  DateTime? invoiceDueDate,
  String? invoiceNotes,
  bool? ispaid,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'user_ref': userRef,
      'client_ref': clientRef,
      'invoice_number': invoiceNumber,
      'invoice_date': invoiceDate,
      'invoice_due_date': invoiceDueDate,
      'invoice_notes': invoiceNotes,
      'ispaid': ispaid,
    }.withoutNulls,
  );

  return firestoreData;
}

class InvoicesRecordDocumentEquality implements Equality<InvoicesRecord> {
  const InvoicesRecordDocumentEquality();

  @override
  bool equals(InvoicesRecord? e1, InvoicesRecord? e2) {
    const listEquality = ListEquality();
    return e1?.userRef == e2?.userRef &&
        e1?.clientRef == e2?.clientRef &&
        e1?.invoiceNumber == e2?.invoiceNumber &&
        e1?.invoiceDate == e2?.invoiceDate &&
        e1?.invoiceDueDate == e2?.invoiceDueDate &&
        e1?.invoiceNotes == e2?.invoiceNotes &&
        e1?.ispaid == e2?.ispaid &&
        listEquality.equals(e1?.invoiceItems, e2?.invoiceItems);
  }

  @override
  int hash(InvoicesRecord? e) => const ListEquality().hash([
        e?.userRef,
        e?.clientRef,
        e?.invoiceNumber,
        e?.invoiceDate,
        e?.invoiceDueDate,
        e?.invoiceNotes,
        e?.ispaid,
        e?.invoiceItems
      ]);

  @override
  bool isValidKey(Object? o) => o is InvoicesRecord;
}
