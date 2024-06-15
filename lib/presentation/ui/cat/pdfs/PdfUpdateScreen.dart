// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:file_picker/file_picker.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:pdftron_flutter/pdftron_flutter.dart';
//
// class PdfUpdateScreen extends StatefulWidget {
//   @override
//   _PdfUpdateScreenState createState() => _PdfUpdateScreenState();
// }
//
// class _PdfUpdateScreenState extends State<PdfUpdateScreen> {
//   String? _pdfPath;
//
//   Future<void> _selectPdf() async {
//     FilePickerResult? result = await FilePicker.platform.pickFiles(
//       type: FileType.custom,
//       allowedExtensions: ['pdf'],
//     );
//
//     if (result != null) {
//       setState(() {
//         _pdfPath = result.files.single.path!;
//       });
//     }
//   }
//
//   // Future<void> _updatePdf() async {
//   //   if (_pdfPath != null) {
//   //     // Load the PDF file
//   //     final documentController = await PdftronFlutter.openDocument(_pdfPath!);
//   //
//   //     // Add text to the PDF
//   //     await documentController.addTextAnnot(
//   //       pageNum: 1,
//   //       x: 100,
//   //       y: 100,
//   //       text: 'Updated Text',
//   //     );
//   //
//   //     // Save the updated PDF file
//   //     final updatedPdfPath = await documentController.saveDocument();
//   //     print('Updated PDF saved to: $updatedPdfPath');
//   //
//   //     // Close the document controller
//   //     await documentController.closeDocument();
//   //   }
//   // }
//
//
//   Future<void> _updatePdf() async {
//     // if (_pdfPath != null) {
//     //   // Open the PDF file
//     //   var documentController = await PdftronFlutter.openDocument(_pdfPath!);
//     //
//     //   // Wait for the document controller to initialize
//     //   await Future.delayed(Duration(seconds: 1)); // Replace this with a proper await mechanism
//     //
//     //   // Add text annotation to the PDF
//     //
//     //   await documentController.addTextAnnot(
//     //     pageNum: 1,
//     //     x: 100,
//     //     y: 100,
//     //     text: 'Updated Text',
//     //   );
//     //
//     //   // Save the updated PDF file
//     //   final updatedPdfPath = await documentController.saveDocument();
//     //   print('Updated PDF saved to: $updatedPdfPath');
//     //
//     //   // Close the document controller
//     //   await documentController.closeDocument();
//     // }
//   }
//
//
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('PDF Update')),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             ElevatedButton(
//               onPressed: _selectPdf,
//               child: Text('Select PDF'),
//             ),
//             SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: _updatePdf,
//               child: Text('Update PDF'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
