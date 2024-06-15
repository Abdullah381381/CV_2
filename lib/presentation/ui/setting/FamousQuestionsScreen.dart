// ignore_for_file: library_private_types_in_public_api

import 'package:cv_project/presentation/widgets/import_all.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

import 'AddQuestionScreen.dart';

class FamousQuestionsCvScreen extends StatefulWidget {
  const FamousQuestionsCvScreen({super.key});

  @override
  _FamousQuestionsScreenState createState() => _FamousQuestionsScreenState();
}

class _FamousQuestionsScreenState extends State<FamousQuestionsCvScreen> {
  DatabaseReference? databaseReference;

  List<Map<dynamic, dynamic>> questionsList = [];

  int? indexs;
  @override
  void initState() {
    super.initState();
    databaseReference = FirebaseDatabase.instance.reference().child('FamousQuestions');
    fetchData();
  }

  void fetchData() {
    databaseReference!.once().then((DatabaseEvent event) {
      DataSnapshot snapshot = event.snapshot;

      questionsList.clear();
      Map<dynamic, dynamic>? values = snapshot.value as Map<dynamic, dynamic>?;

      if (values != null) {
        values.forEach((key, value) {
          questionsList.add(value);
        });
        setState(() {}); // Refresh the UI
      }
    }).catchError((error) {
      print("Error fetching data: $error");
    });
  }



  @override
  Widget build(BuildContext context) {
    User? user = FirebaseAuth.instance.currentUser;
    return Scaffold(
      floatingActionButton:user?.email=="abdullahdarwish786@gmail.com" ?FloatingActionButton(
        backgroundColor: primary2Color,
        tooltip: 'Increment',
        onPressed: () async{
          await  Navigator.push(
            context,
            MaterialPageRoute(builder: (ctx) =>  AddQuestionScreen()),
          );
          setState(() {

          });
        },
        child: const Icon(Icons.add, color: Colors.white, size: 28),
      ):null,
      appBar: AppBar(
        title: const Text('Famous Questions'),
      ),
      body: questionsList.isEmpty
          ? const Center(child: Text('No questions found'))
          : ListView.builder(
        padding: const EdgeInsets.only(left: 22,right: 22),
        itemCount: questionsList.length,
        itemBuilder: (context, index) {
          // return ListTile(
          //   title: Text(questionsList[index]['question']),
          //   subtitle: Text(questionsList[index]['answer']),
          // );
          return InkWell(
            onTap: (){
              setState(() {
                if(indexs!=index){
                  indexs=index;
                }else{
                  indexs=null;
                }

              });
            },
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.only(left: 10,right: 10,top: 10,bottom: 10),
                  decoration: BoxDecoration(
                      color: primary2Color,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10),
                        bottomRight: Radius.circular(indexs==index?0:10),
                        bottomLeft: Radius.circular(indexs==index?0:10),
                      )
                  ),
                  child: Row(
                    children: [
                      Expanded(child: TextApp(
                        text: questionsList[index]['question'],
                        color: Colors.white,
                        maxLines: 4,
                        textAlign: TextAlign.start,
                        fontWeight: FontWeight.w700,
                      )),
                    ],
                  ),
                ),


                if(indexs==index)
                Container(
                  padding: const EdgeInsets.only(left: 10,right: 10,top: 10,bottom: 10),
                  decoration: BoxDecoration(
                      color: primary2Color.withOpacity(.1),
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10),
                      )
                  ),
                  child:Row(
                    children: [
                     Expanded(child:
                      TextApp(
                        text: questionsList[index]['answer'],
                        color: Colors.black,
                        maxLines: 17,
                        textAlign: TextAlign.start,
                        fontWeight: FontWeight.w400,
                      )
                      )
                    ],
                  ),
                ),

                SizedBox(height: 11,),
              ],
            ),
          );
        },
      ),
    );
  }
}
