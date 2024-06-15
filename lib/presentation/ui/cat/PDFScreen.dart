// ignore_for_file: must_be_immutable

import 'dart:io';

import 'package:cv_project/presentation/ui/cat/pdfs/cv0.dart';
import 'package:cv_project/presentation/ui/cat/pdfs/cv1.dart';
import 'package:cv_project/presentation/ui/cat/pdfs/cv2.dart';
import 'package:cv_project/presentation/ui/cat/pdfs/cv3.dart';
import 'package:cv_project/presentation/ui/cat/pdfs/cv4.dart';
import 'package:cv_project/presentation/widgets/import_all.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:share_plus/share_plus.dart';




class PDFScreen extends StatelessWidget {
  final int categoryId;

  PDFScreen({super.key, required this.categoryId});

  List cvs=[
    {"photo":"assets/images/cv1.png","type":"png"},
    {"photo":"assets/images/2.png","type":"png"},
    {"photo":"assets/images/3.jpeg","type":"png"},
    {"photo":"assets/images/6.png","type":"png"},
    {"photo":"assets/images/989.jpg","type":"png"},
    {"photo":"assets/images/3.jpeg","type":"png"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PDF Screen'),
      ),

      body: GridView.builder(
        padding: const EdgeInsets.only(left: 18,right: 18,bottom: 70),
        itemCount: cvs.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,mainAxisExtent: 300,
        mainAxisSpacing: 5,crossAxisSpacing: 10),
        itemBuilder: (_, index) =>  InkWell(
          onTap: (){
            if(index==0){
              CV0.generatePDF(context, categoryId);
            }
            if(index==1){
              CV1.generatePDF(context, categoryId);
            }
            if(index==2){
              CV2.generatePDF(context, categoryId);
            }
            if(index==3){
              CV3.generatePDF(context, categoryId);
            }
            if(index==4){
              CV4.generatePDF(context, categoryId);
            }
            if(index==5){
              CV2.generatePDF(context, categoryId);
            }
          },
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.black,width: 1)
            ),
            child: cvs[index]["type"]=="svg"?
            SvgPicture.asset(cvs[index]["photo"],height: 300,width: 200,fit: BoxFit.fill,)
                :ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(cvs[index]["photo"],height: 200,width: 200,fit: BoxFit.fill,),
            ),
          ),
        ),


      ),
    );
  }

  /// * --------




}


class PDFViewerScreen extends StatelessWidget {
  final String pdfPath;

  const PDFViewerScreen({super.key, required this.pdfPath});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PDF Viewer'),
        actions: [
          Padding(
            padding: const EdgeInsets.only(left: 22,right: 22),
            child: IconButton(
              icon: const Icon(Icons.share),
              onPressed: () async{
                final result = await Share.shareXFiles([XFile(pdfPath)]);

                if (result.status == ShareResultStatus.success) {
                  print('Thank you for sharing the picture!');
                }
              },
            ),
          )
        ],
      ),
      body: Center(
        child: FutureBuilder<File>(
          future: getFileFromPath(pdfPath),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return PDFView(
                autoSpacing: false,
                enableSwipe: true,
                fitEachPage: true,
                defaultPage: 0,

                filePath: snapshot.data!.path,
                // enableSwipe: true,
                // swipeHorizontal: true,
                // autoSpacing: false,
                // pageFling: true,
                // pageSnap: true,
                // // fitPolicy: FitPolicy.BOTH,
                // preventLinkNavigation:
                // false, // if set to true the link is handled in flutter
              );
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else {
              return const CircularProgressIndicator();
            }
          },
        ),
      ),
    );
  }

  Future<File> getFileFromPath(String pdfPath) async {
    return File(pdfPath);
  }
}
