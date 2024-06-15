import 'package:cv_project/presentation/ui/setting/FamousQuestionsScreen.dart';
import 'package:cv_project/presentation/ui/setting/centers.dart';
import 'package:cv_project/presentation/ui/setting/questions_interview.dart';
import 'package:flutter/cupertino.dart';

import '../../widgets/import_all.dart';

class SettingApp extends StatefulWidget {
  const SettingApp({super.key});

  @override
  State<SettingApp> createState() => _SettingAppState();
}

class _SettingAppState extends State<SettingApp> {
  //111.jpeg
  @override
  Widget build(BuildContext context) {
     List<Map<String, dynamic>> items = [
      {
        'image': 'assets/images/111.jpeg',
        'text': 'Famous Questions CV',
        'wid': const FamousQuestionsCvScreen(),
      },
      {
        'image': 'assets/images/222.png',
        'text': 'Frequently asked questions during a job interview',
        'wid': const QuestionsInterview(),
      },
      {
        'image': 'assets/images/333.jpeg',
        'text': 'Approved course centres',
        'wid': const Cnters(),
      },
    ];
    return Scaffold(
      appBar: AppBar(
        title: const Text('Setting'),
      ),
      body:ListView.builder(
        padding: const EdgeInsets.all(10),
        itemCount: items.length,
        itemBuilder: (context, index) {
          return
        InkWell(
          onTap: (){
            Go.to(context: context, page: items[index]['wid']);
          },
          child:  Container(
            height: 260,
            padding: const EdgeInsets.all(10),
            child:  ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Stack(
                children: [
                  Image.asset(
                    items[index]['image']!,
                    width: MediaQuery.of(context).size.width,
                    height: 260,
                    fit: BoxFit.fill,
                  ),

                  Align(
                      alignment: Alignment.bottomLeft,
                      child:
                      Container(
                          padding: const EdgeInsets.only(top: 5,bottom: 5),
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                              color: primary2Color,
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(3),
                                topRight: Radius.circular(3),
                              )
                          ),
                          child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Expanded(child:TextApp(
                                  text: items[index]['text'],
                                  color: Colors.white,
                                  maxLines: 4,
                                  fontSize: 20,
                                  textAlign: TextAlign.center,
                                  fontWeight: FontWeight.w700,
                                ), )
                              ]
                          )
                      )

                  )

                ],
              ),
            ),
          ),
        );
        },
      ),
    );
  }
}
