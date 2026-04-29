import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/backend/schema/structs/index.dart';
import '/auth/firebase_auth/auth_util.dart';

double sumInvoice(
  List<int> quantity,
  List<double> rate,
) {
  // Write a FlutterFlow custom function in Dart called suminvoice. Requirements: Return type: double Parameters: quantity: List<int> rate: List<double> Multiply each quantity by its corresponding rate. Sum all results into a single total. Return the total as a double. If the lists are not the same length, throw an exception. Output only the function code with no explanation.

  double total = 0.0;
  for (int i = 0; i < quantity.length; i++) {
    total += quantity[i] * rate[i];
  }

  return total;
}

List<dynamic> mapInvoiceItemsToJSON(List<ItemsStruct> inputList) {
  return inputList.map((item) {
    return {
      'description': item.descriptions ?? '',
      'rate': (item.rate ?? 0.0).toDouble(),
      'quantity': (item.quantity ?? 0).toInt(),
    };
  }).toList();
}
