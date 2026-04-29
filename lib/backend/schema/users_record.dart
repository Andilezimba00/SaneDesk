import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UsersRecord extends FirestoreRecord {
  UsersRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "phone_number" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  bool hasPhoneNumber() => _phoneNumber != null;

  // "username" field.
  String? _username;
  String get username => _username ?? '';
  bool hasUsername() => _username != null;

  // "last_meditation_at" field.
  DateTime? _lastMeditationAt;
  DateTime? get lastMeditationAt => _lastMeditationAt;
  bool hasLastMeditationAt() => _lastMeditationAt != null;

  // "last_journal_at" field.
  DateTime? _lastJournalAt;
  DateTime? get lastJournalAt => _lastJournalAt;
  bool hasLastJournalAt() => _lastJournalAt != null;

  // "companion_level" field.
  int? _companionLevel;
  int get companionLevel => _companionLevel ?? 0;
  bool hasCompanionLevel() => _companionLevel != null;

  // "last_activity_date" field.
  DateTime? _lastActivityDate;
  DateTime? get lastActivityDate => _lastActivityDate;
  bool hasLastActivityDate() => _lastActivityDate != null;

  // "current_streak" field.
  int? _currentStreak;
  int get currentStreak => _currentStreak ?? 0;
  bool hasCurrentStreak() => _currentStreak != null;

  // "meditation_streak" field.
  int? _meditationStreak;
  int get meditationStreak => _meditationStreak ?? 0;
  bool hasMeditationStreak() => _meditationStreak != null;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "need_scheduled_notifications" field.
  bool? _needScheduledNotifications;
  bool get needScheduledNotifications => _needScheduledNotifications ?? false;
  bool hasNeedScheduledNotifications() => _needScheduledNotifications != null;

  // "manageClients" field.
  DocumentReference? _manageClients;
  DocumentReference? get manageClients => _manageClients;
  bool hasManageClients() => _manageClients != null;

  // "events" field.
  DocumentReference? _events;
  DocumentReference? get events => _events;
  bool hasEvents() => _events != null;

  // "photo_url" field.
  String? _photoUrl;
  String get photoUrl => _photoUrl ?? '';
  bool hasPhotoUrl() => _photoUrl != null;

  // "tax_number" field.
  String? _taxNumber;
  String get taxNumber => _taxNumber ?? '';
  bool hasTaxNumber() => _taxNumber != null;

  // "business_name" field.
  String? _businessName;
  String get businessName => _businessName ?? '';
  bool hasBusinessName() => _businessName != null;

  // "address" field.
  String? _address;
  String get address => _address ?? '';
  bool hasAddress() => _address != null;

  // "logo" field.
  String? _logo;
  String get logo => _logo ?? '';
  bool hasLogo() => _logo != null;

  // "completed_boarding" field.
  bool? _completedBoarding;
  bool get completedBoarding => _completedBoarding ?? false;
  bool hasCompletedBoarding() => _completedBoarding != null;

  // "display_name" field.
  String? _displayName;
  String get displayName => _displayName ?? '';
  bool hasDisplayName() => _displayName != null;

  // "freelancephoto" field.
  String? _freelancephoto;
  String get freelancephoto => _freelancephoto ?? '';
  bool hasFreelancephoto() => _freelancephoto != null;

  // "phonenumberFL" field.
  String? _phonenumberFL;
  String get phonenumberFL => _phonenumberFL ?? '';
  bool hasPhonenumberFL() => _phonenumberFL != null;

  // "freelancemail" field.
  String? _freelancemail;
  String get freelancemail => _freelancemail ?? '';
  bool hasFreelancemail() => _freelancemail != null;

  // "is_premium" field.
  bool? _isPremium;
  bool get isPremium => _isPremium ?? false;
  bool hasIsPremium() => _isPremium != null;

  // "invoice_count" field.
  List<DocumentReference>? _invoiceCount;
  List<DocumentReference> get invoiceCount => _invoiceCount ?? const [];
  bool hasInvoiceCount() => _invoiceCount != null;

  // "manageclients_count" field.
  List<DocumentReference>? _manageclientsCount;
  List<DocumentReference> get manageclientsCount =>
      _manageclientsCount ?? const [];
  bool hasManageclientsCount() => _manageclientsCount != null;

  void _initializeFields() {
    _email = snapshotData['email'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _phoneNumber = snapshotData['phone_number'] as String?;
    _username = snapshotData['username'] as String?;
    _lastMeditationAt = snapshotData['last_meditation_at'] as DateTime?;
    _lastJournalAt = snapshotData['last_journal_at'] as DateTime?;
    _companionLevel = castToType<int>(snapshotData['companion_level']);
    _lastActivityDate = snapshotData['last_activity_date'] as DateTime?;
    _currentStreak = castToType<int>(snapshotData['current_streak']);
    _meditationStreak = castToType<int>(snapshotData['meditation_streak']);
    _uid = snapshotData['uid'] as String?;
    _needScheduledNotifications =
        snapshotData['need_scheduled_notifications'] as bool?;
    _manageClients = snapshotData['manageClients'] as DocumentReference?;
    _events = snapshotData['events'] as DocumentReference?;
    _photoUrl = snapshotData['photo_url'] as String?;
    _taxNumber = snapshotData['tax_number'] as String?;
    _businessName = snapshotData['business_name'] as String?;
    _address = snapshotData['address'] as String?;
    _logo = snapshotData['logo'] as String?;
    _completedBoarding = snapshotData['completed_boarding'] as bool?;
    _displayName = snapshotData['display_name'] as String?;
    _freelancephoto = snapshotData['freelancephoto'] as String?;
    _phonenumberFL = snapshotData['phonenumberFL'] as String?;
    _freelancemail = snapshotData['freelancemail'] as String?;
    _isPremium = snapshotData['is_premium'] as bool?;
    _invoiceCount = getDataList(snapshotData['invoice_count']);
    _manageclientsCount = getDataList(snapshotData['manageclients_count']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('users');

  static Stream<UsersRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UsersRecord.fromSnapshot(s));

  static Future<UsersRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UsersRecord.fromSnapshot(s));

  static UsersRecord fromSnapshot(DocumentSnapshot snapshot) => UsersRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UsersRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UsersRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UsersRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UsersRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUsersRecordData({
  String? email,
  DateTime? createdTime,
  String? phoneNumber,
  String? username,
  DateTime? lastMeditationAt,
  DateTime? lastJournalAt,
  int? companionLevel,
  DateTime? lastActivityDate,
  int? currentStreak,
  int? meditationStreak,
  String? uid,
  bool? needScheduledNotifications,
  DocumentReference? manageClients,
  DocumentReference? events,
  String? photoUrl,
  String? taxNumber,
  String? businessName,
  String? address,
  String? logo,
  bool? completedBoarding,
  String? displayName,
  String? freelancephoto,
  String? phonenumberFL,
  String? freelancemail,
  bool? isPremium,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'email': email,
      'created_time': createdTime,
      'phone_number': phoneNumber,
      'username': username,
      'last_meditation_at': lastMeditationAt,
      'last_journal_at': lastJournalAt,
      'companion_level': companionLevel,
      'last_activity_date': lastActivityDate,
      'current_streak': currentStreak,
      'meditation_streak': meditationStreak,
      'uid': uid,
      'need_scheduled_notifications': needScheduledNotifications,
      'manageClients': manageClients,
      'events': events,
      'photo_url': photoUrl,
      'tax_number': taxNumber,
      'business_name': businessName,
      'address': address,
      'logo': logo,
      'completed_boarding': completedBoarding,
      'display_name': displayName,
      'freelancephoto': freelancephoto,
      'phonenumberFL': phonenumberFL,
      'freelancemail': freelancemail,
      'is_premium': isPremium,
    }.withoutNulls,
  );

  return firestoreData;
}

class UsersRecordDocumentEquality implements Equality<UsersRecord> {
  const UsersRecordDocumentEquality();

  @override
  bool equals(UsersRecord? e1, UsersRecord? e2) {
    const listEquality = ListEquality();
    return e1?.email == e2?.email &&
        e1?.createdTime == e2?.createdTime &&
        e1?.phoneNumber == e2?.phoneNumber &&
        e1?.username == e2?.username &&
        e1?.lastMeditationAt == e2?.lastMeditationAt &&
        e1?.lastJournalAt == e2?.lastJournalAt &&
        e1?.companionLevel == e2?.companionLevel &&
        e1?.lastActivityDate == e2?.lastActivityDate &&
        e1?.currentStreak == e2?.currentStreak &&
        e1?.meditationStreak == e2?.meditationStreak &&
        e1?.uid == e2?.uid &&
        e1?.needScheduledNotifications == e2?.needScheduledNotifications &&
        e1?.manageClients == e2?.manageClients &&
        e1?.events == e2?.events &&
        e1?.photoUrl == e2?.photoUrl &&
        e1?.taxNumber == e2?.taxNumber &&
        e1?.businessName == e2?.businessName &&
        e1?.address == e2?.address &&
        e1?.logo == e2?.logo &&
        e1?.completedBoarding == e2?.completedBoarding &&
        e1?.displayName == e2?.displayName &&
        e1?.freelancephoto == e2?.freelancephoto &&
        e1?.phonenumberFL == e2?.phonenumberFL &&
        e1?.freelancemail == e2?.freelancemail &&
        e1?.isPremium == e2?.isPremium &&
        listEquality.equals(e1?.invoiceCount, e2?.invoiceCount) &&
        listEquality.equals(e1?.manageclientsCount, e2?.manageclientsCount);
  }

  @override
  int hash(UsersRecord? e) => const ListEquality().hash([
        e?.email,
        e?.createdTime,
        e?.phoneNumber,
        e?.username,
        e?.lastMeditationAt,
        e?.lastJournalAt,
        e?.companionLevel,
        e?.lastActivityDate,
        e?.currentStreak,
        e?.meditationStreak,
        e?.uid,
        e?.needScheduledNotifications,
        e?.manageClients,
        e?.events,
        e?.photoUrl,
        e?.taxNumber,
        e?.businessName,
        e?.address,
        e?.logo,
        e?.completedBoarding,
        e?.displayName,
        e?.freelancephoto,
        e?.phonenumberFL,
        e?.freelancemail,
        e?.isPremium,
        e?.invoiceCount,
        e?.manageclientsCount
      ]);

  @override
  bool isValidKey(Object? o) => o is UsersRecord;
}
