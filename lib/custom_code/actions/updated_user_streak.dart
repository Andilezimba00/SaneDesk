// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future updatedUserStreak(DocumentReference? userRef) async {
  if (userRef == null) return;

  try {
    final querySnapshot = await FirebaseFirestore.instance
        .collection('streaks')
        .where('userRef', isEqualTo: userRef)
        .limit(1)
        .get();

    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);

    DocumentReference? streakDocRef;
    Map<String, dynamic>? streakData;

    if (querySnapshot.docs.isNotEmpty) {
      final doc = querySnapshot.docs.first;
      streakDocRef = doc.reference;
      streakData = doc.data();
    }

    int currentStreak = streakData?['streakCount'] ?? 0;
    Timestamp? lastLoginTimestamp = streakData?['lastEntryDate'];
    DateTime? lastLoginDate;

    if (lastLoginTimestamp != null) {
      final lastLogin = lastLoginTimestamp.toDate();
      lastLoginDate = DateTime(lastLogin.year, lastLogin.month, lastLogin.day);
    }

    if (lastLoginDate != null && lastLoginDate.isAtSameMomentAs(today)) {
      return; // Already updated today
    }

    int newStreak = 0;

    if (lastLoginDate == null) {
      newStreak = 1;
    } else {
      final daysDifference = today.difference(lastLoginDate).inDays;

      if (daysDifference == 1) {
        newStreak = currentStreak + 1;
      } else if (daysDifference > 1) {
        newStreak = 1;
      }
    }

    if (newStreak >= 30) {
      newStreak = 0;
    }

    double progress = newStreak / 30.0;

    if (streakDocRef != null) {
      await streakDocRef.update({
        'streakCount': newStreak,
        'lastEntryDate': Timestamp.fromDate(today),
      });
    } else {
      await FirebaseFirestore.instance.collection('streaks').add({
        'userRef': userRef,
        'streakCount': newStreak,
        'lastEntryDate': Timestamp.fromDate(today),
      });
    }
  } catch (e) {
    print('Error updating streak: $e');
  }
}
