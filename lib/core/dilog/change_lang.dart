


import 'package:flutter/material.dart';

import '../../presentation/ui/change_lang.dart';

class ChangeLangDilog{

 static showDialogChangeLang({required BuildContext context}) {
    showDialog(
        barrierDismissible: true,
        context: context,
        builder: (context) {
          return StatefulBuilder(builder: (context, setState) {
            return Material(
                color: Colors.black12,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                          margin: const EdgeInsets.only(
                              left: 15, right: 15, top: 60),
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.transparent,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: ChangeLangDesign(),
                          ))
                      // ),
                    ],
                  ),
                ));
          });
        }).then((val) {});
  }
}