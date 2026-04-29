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

Future<void> updateMeditationStreak(DocumentReference userRef) async {
  final userSnapshot = await userRef.get();
  if (!userSnapshot.exists) return;

  final data = userSnapshot.data() as Map<String, dynamic>;
  final lastActivity = (data['last_meditation_at'] as Timestamp?)?.toDate();
  final currentStreak = (data['meditation_streak'] ?? 0) as int;
  final now = DateTime.now();
  int newStreak = currentStreak;

  if (lastActivity != null) {
    final difference = now.difference(lastActivity).inDays;
    if (difference == 1) {
      newStreak++;
    } else if (difference > 1) {
      newStreak = 1;
    }
  } else {
    newStreak = 1;
  }

  await userRef.update({
    'meditation_streak': newStreak,
    'last_meditation_at': now,
  });
}

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
