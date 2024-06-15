
import 'package:cv_project/presentation/ui/cat/Objective/Objective.dart';

import '../../../widgets/import_all.dart';
import 'dart:io';

import 'package:cv_project/presentation/ui/cat/Language/Language.dart';
import 'package:cv_project/presentation/ui/cat/projects/Project.dart';
import 'package:cv_project/presentation/ui/cat/projects/ProjectDatabaseHelper.dart';
import 'package:cv_project/presentation/ui/cat/skilles/Skill_modele.dart';
import 'package:cv_project/presentation/ui/cat/skilles/SkillsDatabaseHelper.dart';
import 'package:cv_project/presentation/widgets/import_all.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;



import '../Education/Education.dart';
import '../Education/EducationDatabaseHelper.dart';
import '../Experience/Experience.dart';
import '../Experience/ExperienceDatabaseHelper.dart';
import '../Objective/ObjectiveDatabaseHelper.dart';
import '../PDFScreen.dart';
import '../PersonalDetails/PersonalDetails.dart';
import '../PersonalDetails/PersonalDetailsDatabaseHelper.dart';
import '../Reference/Reference.dart';
import '../Reference/ReferenceDatabaseHelper.dart';

class CV3 {
  static  Future<void> generatePDF(BuildContext context,categoryId) async {
    final pdf = pw.Document();
    PersonalDetails? personalDetails = await PersonalDetailsDatabaseHelper
        .instance
        .getPersonalDetailsByCategoryId(categoryId);

    // pw.MemoryImage imageProvider = pw.MemoryImage(personalDetails!.photo);

    Objective? existingObjective = await ObjectiveDatabaseHelper.instance
        .getObjectiveByCategoryId(categoryId);
    List<Education> educations = await EducationDatabaseHelper.instance
        .getEducationByCategoryId(categoryId);

    List<Experience> experiences = await ExperienceDatabaseHelper.instance
        .getExperiencesByCategoryId(categoryId);
    List<Skill> skills =
    await SkillsDatabaseHelper.instance.getSkillsByCategoryId(categoryId);
    List<Project> projects = await ProjectDatabaseHelper.instance
        .getProjectsByCategoryId(categoryId);
    List<Language> language = await LanguageDatabaseHelper.instance
        .getLanguagesByCategoryId(categoryId);

    Reference? existingReference = await ReferenceDatabaseHelper.instance.getReferenceByCategoryId(categoryId);

    // Add a page to the PDF

    pdf.addPage(
      pw.MultiPage(
        margin: const pw.EdgeInsets.all(10),
        textDirection: pw.TextDirection.ltr,
        build: (pw.Context contextPw) {
          return [
            pw.Container(
              padding: const pw.EdgeInsets.only(left: 40,top: 5),
              decoration: pw.BoxDecoration(
                border: pw.Border.all(color: PdfColors.blue,width: 8)
              ),
              child: pw.Column(
                crossAxisAlignment: pw.CrossAxisAlignment.start,
                mainAxisAlignment: pw.MainAxisAlignment.start,
                children: [

                  pw.Text(
                    personalDetails?.name ?? '',
                    style: pw.TextStyle(
                      color: PdfColors.black,
                      fontSize: 42,
                      fontStyle: pw.FontStyle.normal,
                    ),
                  ),

                  pw.SizedBox(
                    height: 20,
                  ),

                  pw.Text(
                    personalDetails?.notes ?? '',
                    style: pw.TextStyle(
                      color: PdfColors.black,
                      fontSize: 22,
                      fontStyle: pw.FontStyle.normal,
                    ),
                  ),
                  pw.SizedBox(
                    height: 20,
                  ),



                  pw.Container(
                    padding: const pw.EdgeInsets.only(left: 10),
                    decoration: pw.BoxDecoration(
                        color: PdfColors.blue,
                        border: pw.Border.all(color: PdfColors.blue,width: 8)
                    ),
                    child: pw.Column(
                        children: [
                          pw.Row(
                            mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                            children: [
                              pw.Row( children: [
                                pw.Text('email :- ',
                                    style: const pw.TextStyle(
                                        fontSize: 20, color: PdfColors.white)),
                                // Email address text
                                pw.Text(personalDetails?.email ?? '',
                                    style: const pw.TextStyle(
                                        fontSize: 20, color: PdfColors.white)),
                                // Email address text
                              ]),


                              pw.Row(children: [
                                pw.Text('phone :- ',
                                    style: const pw.TextStyle(
                                        fontSize: 20, color: PdfColors.white)),
                                // Email address text
                                pw.Text(personalDetails?.phone ?? '',
                                    style: const pw.TextStyle(
                                        fontSize: 20, color: PdfColors.white)),
                                // Email address text
                              ]),


                            ],
                          ),

                          pw.SizedBox(height: 20,),

                          pw.Row(
                            mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                            children: [
                              pw.Wrap(spacing: 10, runSpacing: 5, children: [
                                pw.Text('address :- ',
                                    style: const pw.TextStyle(
                                        fontSize: 20, color: PdfColors.white)),
                                // Email address text
                                pw.Text(personalDetails?.address ?? '',
                                    style: const pw.TextStyle(
                                        fontSize: 20, color: PdfColors.white)),
                                // Email address text
                              ]),
                            ],
                          ),

                          pw.SizedBox(height: 20,),
                        ]
                    ),
                  ),


                  pw.SizedBox(
                    height: 20,
                  ),


                  pw.Text(
                    'Objective',
                    style: pw.TextStyle(
                      color: PdfColors.black,
                      fontSize: 22,
                      fontStyle: pw.FontStyle.normal,
                    ),
                  ),
                  pw.SizedBox(
                    height: 10,
                  ),
                  pw.Text(
                    existingObjective?.objective ?? '',
                    style: pw.TextStyle(
                      color: PdfColors.grey,
                      fontSize: 18,
                      fontStyle: pw.FontStyle.normal,
                    ),
                  ),
                  pw.SizedBox(
                    height: 20,
                  ),

                  pw.Row(
                    crossAxisAlignment: pw.CrossAxisAlignment.start,
                      mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                      children:[

                      pw.Expanded(
                        child: pw.Column(
                            mainAxisAlignment: pw.MainAxisAlignment.start,
                          children: [
                            pw.Row(
                              children: [
                                pw.Text(
                                  'Education',
                                  style: pw.TextStyle(
                                    color: PdfColors.grey900,
                                    fontSize: 22,
                                    fontStyle: pw.FontStyle.normal,
                                  ),
                                ),
                              ]
                            ),

                            pw.SizedBox(
                              height: 10,
                            ),
                            for (int index = 0; index < educations.length; index++)
                              pw.Column(
                                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                                  mainAxisAlignment: pw.MainAxisAlignment.start,
                                  children: [
                                    pw.Row(
                                        crossAxisAlignment: pw.CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                        pw.MainAxisAlignment.spaceBetween,
                                        children: [
                                          pw.Text(
                                            educations[index].courseOrDegree,
                                            style: pw.TextStyle(
                                              color: PdfColors.black,
                                              fontSize: 22,
                                              fontStyle: pw.FontStyle.normal,
                                            ),
                                          ),
                                          pw.Text(
                                            educations[index]
                                                .year
                                                .toString()
                                                .substring(0, 10),
                                            style: pw.TextStyle(
                                              color: PdfColors.black,
                                              fontSize: 18,
                                              fontStyle: pw.FontStyle.normal,
                                            ),
                                          ),
                                        ]),
                                    pw.SizedBox(
                                      height: 10,
                                    ),
                                    pw.Text(
                                      educations[index].schoolOrUniversity,
                                      style: pw.TextStyle(
                                        color: PdfColors.grey,
                                        fontSize: 15,
                                        fontStyle: pw.FontStyle.normal,
                                      ),
                                    ),
                                    pw.SizedBox(
                                      height: 10,
                                    ),
                                    pw.Text(
                                      educations[index].grade,
                                      style: pw.TextStyle(
                                        color: PdfColors.grey,
                                        fontSize: 15,
                                        fontStyle: pw.FontStyle.normal,
                                      ),
                                    ),
                                    pw.SizedBox(
                                      height: 10,
                                    ),
                                  ]),

                          ]
                        )
                      ),

                        pw.SizedBox(
                          width: 20,
                        ),
                        pw.Expanded(
                            child:pw.Container(
                              padding: const pw.EdgeInsets.only(left: 20),
                                decoration: const pw.BoxDecoration(
                                    border: pw.Border(
                                      left: pw.BorderSide(color: PdfColors.blue,)
                                    )
                                ),
                              child: pw.Column(
                                  mainAxisAlignment: pw.MainAxisAlignment.start,
                                  children: [
                                    pw.Row(
                                        children: [
                                          pw.Text(
                                            'Experience',
                                            style: pw.TextStyle(
                                              color: PdfColors.grey900,
                                              fontSize: 22,
                                              fontStyle: pw.FontStyle.normal,
                                            ),
                                          ),
                                        ]
                                    ),

                                    pw.SizedBox(
                                      height: 10,
                                    ),
                                    pw.ListView.builder(
                                      itemCount: experiences.length,
                                      itemBuilder: (context, index) {
                                        return pw.Column(
                                            crossAxisAlignment: pw.CrossAxisAlignment.start,
                                            mainAxisAlignment: pw.MainAxisAlignment.start,
                                            children: [
                                              pw.Column(
                                                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                                                  mainAxisAlignment: pw.MainAxisAlignment.start,
                                                  children: [

                                                    pw.Row(),
                                                    pw.Text(
                                                      experiences[index].companyName ?? '',
                                                      style: pw.TextStyle(
                                                        color: PdfColors.black,
                                                        fontSize: 22,
                                                        fontStyle: pw.FontStyle.normal,
                                                      ),
                                                    ),

                                                    pw.Text(
                                                      // "",
                                                      DateFormat('MMM y').format(experiences[index].startDate).toString()+" - "+
                                                          DateFormat('MMM y').format(experiences[index].endDate).toString(),
                                                      style: pw.TextStyle(
                                                        color: PdfColors.black,
                                                        fontSize: 18,
                                                        fontStyle: pw.FontStyle.normal,
                                                      ),
                                                      textAlign: pw.TextAlign.start
                                                    ),
                                                  ]
                                              ),


                                              pw.SizedBox(height: 10,),
                                              pw.Text(
                                                "jobTitle :- ${experiences[index].jobTitle}",
                                                style: pw.TextStyle(
                                                  color: PdfColors.grey,
                                                  fontSize: 15,
                                                  fontStyle: pw.FontStyle.normal,
                                                ),
                                              ),
                                              pw.SizedBox(height: 10,),
                                              pw.Text(
                                                "details :- ${experiences[index].details}",
                                                style: pw.TextStyle(
                                                  color: PdfColors.grey,
                                                  fontSize: 15,
                                                  fontStyle: pw.FontStyle.normal,
                                                ),
                                              ),

                                              pw.SizedBox(height: 10,),
                                            ]
                                        );
                                      },
                                    ),
                                  ]
                              )
                            )
                      )
                      ]
                  ),


                  pw.SizedBox(
                    height: 20,
                  ),


                  pw.Row(
                      crossAxisAlignment: pw.CrossAxisAlignment.start,
                      mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                      children:[

                        pw.Expanded(
                            child: pw.Column(
                                mainAxisAlignment: pw.MainAxisAlignment.start,
                                children: [
                                  pw.Row(
                                      children: [
                                        pw.Text(
                                          'Skills',
                                          style: pw.TextStyle(
                                            color: PdfColors.grey900,
                                            fontSize: 22,
                                            fontStyle: pw.FontStyle.normal,
                                          ),
                                        ),
                                      ]
                                  ),

                                  pw.SizedBox(
                                    height: 10,
                                  ),
                                  pw.ListView.builder(
                                    itemCount: skills.length,
                                    itemBuilder: (context, index) {
                                      return pw.Column(
                                          crossAxisAlignment: pw.CrossAxisAlignment.start,
                                          mainAxisAlignment: pw.MainAxisAlignment.start,
                                          children: [
                                            pw.Row(
                                                crossAxisAlignment: pw.CrossAxisAlignment.start,
                                                mainAxisAlignment: pw.MainAxisAlignment
                                                    .spaceBetween,
                                                children: [


                                                  pw.Expanded(
                                                    child:    pw.Row(
                                                        children: [
                                                          pw.Container(
                                                              height: 10,width: 10,
                                                              decoration: pw.BoxDecoration(
                                                                  color: PdfColors.black,
                                                                  borderRadius: pw.BorderRadius.circular(10)
                                                              )
                                                          ),
                                                          pw.SizedBox(width: 10),
                                                          pw.Expanded(
                                                            child: pw.Text(
                                                              skills[index].name ?? '',
                                                              style: pw.TextStyle(
                                                                color: PdfColors.black,
                                                                fontSize: 22,
                                                                fontStyle: pw.FontStyle.normal,
                                                              ),
                                                            ),
                                                          ),

                                                        ]
                                                    ),
                                                  ),


                                                  pw.Text(
                                                    "Level ${skills[index].level}",
                                                    style: pw.TextStyle(
                                                      color: PdfColors.black,
                                                      fontSize: 18,
                                                      fontStyle: pw.FontStyle.normal,
                                                    ),
                                                  ),
                                                ]
                                            ),

                                            pw.SizedBox(height: 10,),
                                          ]
                                      );
                                    },
                                  ),

                                ]
                            )
                        ),

                        pw.SizedBox(
                          width: 20,
                        ),
                        pw.Expanded(
                            child:pw.Container(
                                padding: const pw.EdgeInsets.only(left: 20),
                                decoration: const pw.BoxDecoration(
                                    border: pw.Border(
                                        left: pw.BorderSide(color: PdfColors.blue,)
                                    )
                                ),
                                child: pw.Column(
                                    mainAxisAlignment: pw.MainAxisAlignment.start,
                                    children: [
                                      pw.Row(
                                          children: [
                                            pw.Text(
                                              'Language',
                                              style: pw.TextStyle(
                                                color: PdfColors.grey900,
                                                fontSize: 22,
                                                fontStyle: pw.FontStyle.normal,
                                              ),
                                            ),
                                          ]
                                      ),

                                      pw.SizedBox(
                                        height: 10,
                                      ),
                                      pw.ListView.builder(
                                        itemCount: language.length,
                                        itemBuilder: (context, index) {
                                          return pw.Column(
                                              crossAxisAlignment: pw.CrossAxisAlignment.start,
                                              mainAxisAlignment: pw.MainAxisAlignment.start,
                                              children: [
                                                pw.Row(
                                                    crossAxisAlignment: pw.CrossAxisAlignment.start,
                                                    mainAxisAlignment: pw.MainAxisAlignment
                                                        .spaceBetween,
                                                    children: [


                                                      pw.Expanded(
                                                        child:    pw.Row(
                                                            children: [
                                                              pw.Container(
                                                                  height: 10,width: 10,
                                                                  decoration: pw.BoxDecoration(
                                                                      color: PdfColors.black,
                                                                      borderRadius: pw.BorderRadius.circular(10)
                                                                  )
                                                              ),
                                                              pw.SizedBox(width: 10),
                                                              pw.Expanded(
                                                                child: pw.Text(
                                                                  language[index].name ?? '',
                                                                  style: pw.TextStyle(
                                                                    color: PdfColors.black,
                                                                    fontSize: 22,
                                                                    fontStyle: pw.FontStyle.normal,
                                                                  ),
                                                                ),
                                                              ),

                                                            ]
                                                        ),
                                                      ),


                                                      pw.Text(
                                                        "${language[index].grade}",
                                                        style: pw.TextStyle(
                                                          color: PdfColors.black,
                                                          fontSize: 18,
                                                          fontStyle: pw.FontStyle.normal,
                                                        ),
                                                      ),
                                                    ]
                                                ),

                                                pw.SizedBox(height: 10,),
                                              ]
                                          );
                                        },
                                      ),
                                    ]
                                )
                            )
                        )
                      ]
                  ),


                  pw.SizedBox(
                    height: 40,
                  ),


                  pw.Row(
                      mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                      children:[

                        pw.Expanded(
                            child: pw.Column(
                                mainAxisAlignment: pw.MainAxisAlignment.start,
                                children: [
                                  pw.Row(
                                      children: [
                                        pw.Text(
                                          'Projects',
                                          style: pw.TextStyle(
                                            color: PdfColors.grey900,
                                            fontSize: 22,
                                            fontStyle: pw.FontStyle.normal,
                                          ),
                                        ),
                                      ]
                                  ),

                                  pw.SizedBox(
                                    height: 10,
                                  ),
                                  pw.ListView.builder(
                                    itemCount: projects.length,
                                    itemBuilder: (context, index) {
                                      return pw.Column(
                                          crossAxisAlignment: pw.CrossAxisAlignment.start,
                                          mainAxisAlignment: pw.MainAxisAlignment.start,
                                          children: [
                                            pw.Row(
                                                crossAxisAlignment: pw.CrossAxisAlignment.start,
                                                mainAxisAlignment: pw.MainAxisAlignment
                                                    .spaceBetween,
                                                children: [
                                                  pw.Expanded(
                                                    child:  pw.Text(
                                                      projects[index].title ?? '',
                                                      style: pw.TextStyle(
                                                        color: PdfColors.black,
                                                        fontSize: 22,
                                                        fontStyle: pw.FontStyle.normal,
                                                      ),
                                                    ),
                                                  )


                                                ]
                                            ),


                                            pw.SizedBox(height: 10,),
                                            pw.Text(
                                              "details :- ${projects[index].description}",
                                              style: pw.TextStyle(
                                                color: PdfColors.grey,
                                                fontSize: 15,
                                                fontStyle: pw.FontStyle.normal,
                                              ),
                                            ),

                                            pw.SizedBox(height: 10,),
                                          ]
                                      );
                                    },
                                  ),

                                ]
                            )
                        ),

                        pw.SizedBox(
                          width: 20,
                        ),
                        // pw.Expanded(
                        //     child:pw.Container(
                        //         padding: pw.EdgeInsets.only(left: 20),
                        //         decoration: pw.BoxDecoration(
                        //             border: pw.Border(
                        //                 left: pw.BorderSide(color: PdfColors.blue,)
                        //             )
                        //         ),
                        //
                        //     )
                        // )
                      ]
                  ),

                  pw.SizedBox(
                    height: 40,
                  ),

                  pw.SizedBox(
                    height: 10,
                  ),
                  pw.Divider(color: PdfColors.grey),
                  pw.SizedBox(
                    height: 10,
                  ),


                  pw.Column(
                      crossAxisAlignment: pw.CrossAxisAlignment.start,
                      mainAxisAlignment: pw.MainAxisAlignment.start,
                      children: [
                        pw.Text(
                            'Reference',
                            style: pw.TextStyle(
                              color: PdfColors.black,
                              fontSize: 18,
                              fontStyle: pw.FontStyle.normal,
                            ),
                            maxLines: 10
                        ),
                        pw.SizedBox(
                          height: 10,
                        ),
                        pw.Wrap(spacing: 10, runSpacing: 5, children: [
                          pw.Text(
                              'Name',
                              style: pw.TextStyle(
                                color: PdfColors.black,
                                fontSize: 18,
                                fontStyle: pw.FontStyle.normal,
                              ),
                              maxLines: 10
                          ),
                          // Email address text
                          pw.Text(existingReference?.name ?? '',
                              style: const pw.TextStyle(
                                  fontSize: 20, color: PdfColors.grey)),
                          // Email address text
                        ]),
                        pw.SizedBox(
                          height: 10,
                        ),
                        pw.Wrap(spacing: 10, runSpacing: 5, children: [
                          pw.Text(
                              'Address',
                              style: pw.TextStyle(
                                color: PdfColors.black,
                                fontSize: 18,
                                fontStyle: pw.FontStyle.normal,
                              ),
                              maxLines: 10
                          ),
                          // Email address text
                          pw.Text(existingReference?.university ?? '',
                              style: const pw.TextStyle(
                                  fontSize: 20, color: PdfColors.grey)),
                          // Email address text
                        ]),
                        pw.SizedBox(
                          height: 10,
                        ),
                        pw.Wrap(spacing: 10, runSpacing: 5, children: [
                          pw.Text(
                              'Phone',
                              style: pw.TextStyle(
                                color: PdfColors.black,
                                fontSize: 18,
                                fontStyle: pw.FontStyle.normal,
                              ),
                              maxLines: 10
                          ),
                          // Email address text
                          pw.Text(existingReference?.phone ?? '',
                              style: const pw.TextStyle(
                                  fontSize: 20, color: PdfColors.grey)),
                          // Email address text
                        ]),
                        pw.SizedBox(
                          height: 10,
                        ),
                        pw.Wrap(spacing: 10, runSpacing: 5, children: [
                          pw.Text(
                              'Email',
                              style: pw.TextStyle(
                                color: PdfColors.black,
                                fontSize: 18,
                                fontStyle: pw.FontStyle.normal,
                              ),
                              maxLines: 10
                          ),
                          // Email address text
                          pw.Text(existingReference?.email ?? '',
                              style: const pw.TextStyle(
                                  fontSize: 20, color: PdfColors.grey)),
                          // Email address text
                        ]),

                      ]
                  ),

                  pw.SizedBox(
                    height: 40,
                  ),
                ],
              )
            )
          ];
        },
      ),
    );

    //
    // Save the PDF to a file
    final output = await Directory.systemTemp.createTemp('pdfs');
    final file = File('${output.path}/example.pdf');
    await file.writeAsBytes(await pdf.save());

    // String wordContent = convertPdfToWord(file.path);
    // var wordContent = await convertPdfToDoc(file);


    // Save the Word document to device storage
    // await saveWordDocument(wordContent);
    //
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PDFViewerScreen(pdfPath: file.path),
      ),
    );
  }
}