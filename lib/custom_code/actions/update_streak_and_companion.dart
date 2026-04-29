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

import 'package:cloud_firestore/cloud_firestore.dart';

Future<void> updateStreakAndCompanion(DocumentReference userRef) async {
  final now = DateTime.now();
  final today = DateTime(now.year, now.month, now.day);

  final userSnap = await userRef.get();
  if (!userSnap.exists) return;
  final userData = userSnap.data() as Map<String, dynamic>;

  int currentStreak = (userData['current_streak'] ?? 0) as int;
  Timestamp? lastActivityTS = userData['last_activity'] as Timestamp?;
  DateTime? lastActivity = lastActivityTS?.toDate();

  if (lastActivity == null) {
    currentStreak = 1;
  } else {
    final lastDate =
        DateTime(lastActivity.year, lastActivity.month, lastActivity.day);
    final diff = today.difference(lastDate).inDays;
    if (diff == 0) {
      // same day, no streak change
    } else if (diff == 1) {
      currentStreak += 1;
    } else {
      currentStreak = 1;
    }
  }

  int companionLevel;
  if (currentStreak <= 2)
    companionLevel = 1;
  else if (currentStreak <= 6)
    companionLevel = 2;
  else if (currentStreak <= 13)
    companionLevel = 3;
  else
    companionLevel = 4;

  await userRef.update({
    'current_streak': currentStreak,
    'last_activity': Timestamp.fromDate(now),
    'last_journal_at': Timestamp.fromDate(now),
    'companion_level': companionLevel,
  });
}

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
