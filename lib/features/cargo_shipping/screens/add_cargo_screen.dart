import 'package:flutter/material.dart';
import 'package:advance_pdf_viewer/advance_pdf_viewer.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pdfWidgets;
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';

void main() {
  runApp(MaterialApp(
    home: AddShipmentScreen(),
  ));
}

class AddShipmentScreen extends StatefulWidget {
  @override
  _AddShipmentScreenState createState() => _AddShipmentScreenState();
}

class _AddShipmentScreenState extends State<AddShipmentScreen> {
  TextEditingController originController = TextEditingController();
  TextEditingController destinationController = TextEditingController();
  TextEditingController cargoDescriptionController = TextEditingController();
  PDFDocument? pdfDocument;

  Future<void> generatePDF() async {
    final pdf = pdfWidgets.Document();
    final origin = originController.text;
    final destination = destinationController.text;
    final cargoDescription = cargoDescriptionController.text;

    // Register the external font
    final font =
        pdfWidgets.Font.ttf(await rootBundle.load("assets/fonts/arial.ttf"));

    pdf.addPage(
      pdfWidgets.Page(
        build: (context) {
          return pdfWidgets.Column(
            crossAxisAlignment: pdfWidgets.CrossAxisAlignment.start,
            children: [
              pdfWidgets.Text(
                'Shipment Details',
                style: pdfWidgets.TextStyle(fontSize: 20, font: font),
              ),
              pdfWidgets.Text('Origin: $origin',
                  style: pdfWidgets.TextStyle(font: font)),
              pdfWidgets.Text('Destination: $destination',
                  style: pdfWidgets.TextStyle(font: font)),
              pdfWidgets.Text('Cargo Description: $cargoDescription',
                  style: pdfWidgets.TextStyle(font: font)),
              // Add more details as needed
            ],
          );
        },
      ),
    );

    final directory = await getApplicationDocumentsDirectory();
    final pdfPath = '${directory.path}/shipment_details.pdf';

    final file = File(pdfPath);
    await file.writeAsBytes(await pdf.save());

    final pdfViewer = await PDFDocument.fromFile(file);

    setState(() {
      pdfDocument = pdfViewer;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Shipment Details"),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextFormField(
              controller: originController,
              decoration: InputDecoration(labelText: "Origin"),
            ),
            SizedBox(height: 10),
            TextFormField(
              controller: destinationController,
              decoration: InputDecoration(labelText: "Destination"),
            ),
            SizedBox(height: 10),
            TextFormField(
              controller: cargoDescriptionController,
              decoration: InputDecoration(labelText: "Cargo Description"),
              maxLines: 3,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                generatePDF();
              },
              child: Text("Generate Shipment PDF"),
            ),
            SizedBox(height: 20),
            if (pdfDocument != null)
              PDFViewer(
                document: pdfDocument!,
              ), // Display the generated PDF
          ],
        ),
      ),
    );
  }
}
