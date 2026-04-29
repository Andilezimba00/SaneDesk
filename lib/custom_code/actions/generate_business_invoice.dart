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

Future generateBusinessInvoice(
  String invoiceNumber,
  List<dynamic> items,
  double total,
  String? notes,
  String? businessName,
  String? taxNumber,
  String? address,
  String? logo,
  String? clientName,
  String? clientAddress,
  String? taxNumberClient,
) async {
  final pdf = pw.Document();

  pw.ImageProvider? netLogo;
  if (logo != null && logo.isNotEmpty) {
    try {
      netLogo = await networkImage(logo);
    } catch (e) {
      netLogo = null;
    }
  }

  pdf.addPage(pw.MultiPage(
    build: (pw.Context context) => [
      pw.Row(mainAxisAlignment: pw.MainAxisAlignment.spaceBetween, children: [
        pw.Column(crossAxisAlignment: pw.CrossAxisAlignment.start, children: [
          if (netLogo != null)
            pw.Container(height: 60, width: 60, child: pw.Image(netLogo)),
          pw.Text(businessName ?? '',
              style:
                  pw.TextStyle(fontWeight: pw.FontWeight.bold, fontSize: 18)),
          pw.Text('Tax ID: ${taxNumber ?? ""}',
              style: pw.TextStyle(fontSize: 10)),
          pw.Container(
              width: 150,
              child: pw.Text(address ?? '', style: pw.TextStyle(fontSize: 10))),
        ]),
        pw.Column(crossAxisAlignment: pw.CrossAxisAlignment.end, children: [
          pw.Text('TAX INVOICE',
              style: pw.TextStyle(
                  fontSize: 25,
                  fontWeight: pw.FontWeight.bold,
                  color: PdfColors.blue800)),
          pw.Text('#$invoiceNumber'),
        ]),
      ]),
      pw.SizedBox(height: 25),
      pw.Row(mainAxisAlignment: pw.MainAxisAlignment.spaceBetween, children: [
        pw.Column(crossAxisAlignment: pw.CrossAxisAlignment.start, children: [
          pw.Text('BILL TO:',
              style:
                  pw.TextStyle(fontWeight: pw.FontWeight.bold, fontSize: 10)),
          pw.Text(clientName ?? '',
              style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
          pw.Text(clientAddress ?? '', style: pw.TextStyle(fontSize: 10)),
          if (taxNumberClient != null)
            pw.Text('Client Tax ID: $taxNumberClient',
                style: pw.TextStyle(fontSize: 10)),
        ]),
      ]),
      pw.SizedBox(height: 20),
      pw.Table.fromTextArray(
        headerDecoration: pw.BoxDecoration(color: PdfColors.grey300),
        data: <List<String>>[
          ['Description', 'Qty', 'Rate', 'Total'],
          ...items.map((i) => [
                i['description']?.toString() ?? '',
                i['quantity']?.toString() ?? '0',
                (i['rate'] ?? 0.0).toStringAsFixed(2),
                ((i['quantity'] ?? 0) * (i['rate'] ?? 0.0)).toStringAsFixed(2)
              ]),
        ],
      ),
      pw.SizedBox(height: 30),
      pw.Row(
          mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
          crossAxisAlignment: pw.CrossAxisAlignment.end,
          children: [
            pw.Expanded(
                child: pw.Text('Notes: ${notes ?? ""}',
                    style: pw.TextStyle(fontSize: 9))),
            pw.Column(crossAxisAlignment: pw.CrossAxisAlignment.end, children: [
              // FIX: Wrapped Divider in SizedBox to control width since Divider(width:) is invalid
              pw.SizedBox(width: 100, child: pw.Divider()),
              pw.Text('Total: \$${total.toStringAsFixed(2)}',
                  style: pw.TextStyle(
                      fontSize: 16, fontWeight: pw.FontWeight.bold)),
            ]),
          ]),
    ],
  ));
  await Printing.layoutPdf(onLayout: (format) async => pdf.save());
}
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
