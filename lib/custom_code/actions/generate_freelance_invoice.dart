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

import 'dart:typed_data';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

Future generateFreelanceInvoice(
  String invoiceNumber,
  List<dynamic> items,
  double total,
  String? notes,
  String? displayName,
  String? freelancePhoto, // This will receive the ImagePath string
  String? phoneNumberFL,
  String? freelanceMail,
  String? clientName,
  String? clientAddress,
) async {
  final pdf = pw.Document();

  pw.ImageProvider? netPhoto;

  // Handling the ImagePath logic
  if (freelancePhoto != null && freelancePhoto.isNotEmpty) {
    try {
      netPhoto = await networkImage(freelancePhoto);
    } catch (e) {
      // Fallback if image fails to load
      netPhoto = null;
    }
  }

  pdf.addPage(pw.MultiPage(
    build: (pw.Context context) => [
      pw.Row(mainAxisAlignment: pw.MainAxisAlignment.spaceBetween, children: [
        pw.Row(children: [
          if (netPhoto != null)
            pw.Container(
                height: 50,
                width: 50,
                child: pw.ClipOval(
                    child: pw.Image(netPhoto, fit: pw.BoxFit.cover))),
          pw.SizedBox(width: 10),
          pw.Column(crossAxisAlignment: pw.CrossAxisAlignment.start, children: [
            pw.Text(displayName ?? '',
                style:
                    pw.TextStyle(fontWeight: pw.FontWeight.bold, fontSize: 16)),
            pw.Text(freelanceMail ?? '', style: pw.TextStyle(fontSize: 10)),
            pw.Text(phoneNumberFL ?? '', style: pw.TextStyle(fontSize: 10)),
          ]),
        ]),
        pw.Text('INVOICE',
            style: pw.TextStyle(fontSize: 25, fontWeight: pw.FontWeight.bold)),
      ]),
      pw.SizedBox(height: 30),
      pw.Column(crossAxisAlignment: pw.CrossAxisAlignment.start, children: [
        pw.Text('Bill To:',
            style: pw.TextStyle(fontSize: 10, color: PdfColors.grey700)),
        pw.Text(clientName ?? '',
            style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
        pw.Text(clientAddress ?? '', style: pw.TextStyle(fontSize: 10)),
      ]),
      pw.Divider(height: 30),
      pw.Table.fromTextArray(
        border: null,
        headerStyle: pw.TextStyle(fontWeight: pw.FontWeight.bold),
        data: <List<String>>[
          ['Service Description', 'Qty', 'Rate', 'Subtotal'],
          ...items.map((i) => [
                i['description']?.toString() ?? '',
                i['quantity']?.toString() ?? '0',
                (i['rate'] ?? 0.0).toStringAsFixed(2),
                ((i['quantity'] ?? 0) * (i['rate'] ?? 0.0)).toStringAsFixed(2)
              ]),
        ],
      ),
      pw.SizedBox(height: 40),
      pw.Container(
          alignment: pw.Alignment.centerRight,
          child: pw.Text('Amount Due: \$${total.toStringAsFixed(2)}',
              style:
                  pw.TextStyle(fontSize: 18, fontWeight: pw.FontWeight.bold))),
      if (notes != null && notes.isNotEmpty)
        pw.Padding(
            padding: const pw.EdgeInsets.only(top: 20),
            child: pw.Text('Notes: $notes',
                style: pw.TextStyle(fontSize: 9, color: PdfColors.grey700))),
    ],
  ));

  await Printing.layoutPdf(onLayout: (format) async => pdf.save());
}
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
