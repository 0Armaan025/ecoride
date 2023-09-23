import 'package:flutter/material.dart';
import 'package:advance_pdf_viewer/advance_pdf_viewer.dart';

void main() {
  runApp(MaterialApp(
    home: PDFViewerScreen(),
  ));
}

class PDFViewerScreen extends StatefulWidget {
  @override
  _PDFViewerScreenState createState() => _PDFViewerScreenState();
}

class _PDFViewerScreenState extends State<PDFViewerScreen> {
  PDFDocument? document;

  @override
  void initState() {
    super.initState();
    loadDocument();
  }

  Future<void> loadDocument() async {
    final pdf = await PDFDocument.fromAsset('assets/sample.pdf'); // Replace with your PDF file path
    setState(() {
      document = pdf;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("PDF Viewer"),
      ),
      body: Center(
        child: document == null
            ? CircularProgressIndicator() // Show loading indicator while PDF is loading
            : PDFViewer(document: document!), // Display the PDF
      ),
    );
  }
}
