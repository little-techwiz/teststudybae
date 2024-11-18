import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart'; // Import the new PDF viewer package

class DocumentViewPage extends StatelessWidget {
  final String documentName = "Sample Document"; // Example document name
  final String documentPath = "assets/sample_document.pdf";

  const DocumentViewPage({Key? key}) : super(key: key); // Path to the document file

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(documentName),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.more_vert),
            onPressed: () {
              // Implement options like download and share
            },
          ),
        ],
      ),
      body: PDFView(
        filePath: documentPath,
        autoSpacing: false,
        fitEachPage: false,
        onRender: (pages) {
          //print('Document rendered with $pages pages.');
        },
        onError: (error) {
          //print(error.toString());
        },
        onPageError: (page, error) {
          //print('$page: $error');
        },
        onViewCreated: (controller) {
          // Additional setup for the PDF controller if needed
        },
      ),
    );
  }
}
