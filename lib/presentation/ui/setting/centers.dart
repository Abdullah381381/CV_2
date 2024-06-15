import 'package:cv_project/presentation/ui/setting/add_centers.dart';
import 'package:cv_project/presentation/widgets/import_all.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:url_launcher/url_launcher.dart';

import 'add_questions_interview.dart';

class Cnters extends StatefulWidget {
  const Cnters({super.key});

  @override
  State<Cnters> createState() => _QuestionsInterviewState();
}

class _QuestionsInterviewState extends State<Cnters> {
  DatabaseReference? databaseReference;

  List<Map<dynamic, dynamic>> questionsList = [];

  int? indexs;
  @override
  void initState() {
    super.initState();
    databaseReference = FirebaseDatabase.instance.reference().child('CourseCentres');
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
            MaterialPageRoute(builder: (ctx) =>  const AddCenters()),
          );
          setState(() {

          });
        },
        child: const Icon(Icons.add, color: Colors.white, size: 28),
      ):null,
      appBar: AppBar(
        title: const Text('Approved course centres'),
      ),
      body: questionsList.isEmpty
          ? const Center(child: Text('No Approved course centres found'))
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
                openUrl(questionsList[index]['web']);
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
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10),
                        // bottomRight: Radius.circular(indexs==index?0:10),
                        // bottomLeft: Radius.circular(indexs==index?0:10),
                      )
                  ),
                  child: Row(
                    children: [
                      Expanded(child: TextApp(
                        text: questionsList[index]['name'],
                        color: Colors.white,
                        maxLines: 4,
                        textAlign: TextAlign.start,
                        fontWeight: FontWeight.w700,
                      )),
                    ],
                  ),
                ),


                // if(indexs==index)
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
                          text: questionsList[index]['des'],
                          color: Colors.black,
                          maxLines: 17,
                          textAlign: TextAlign.start,
                          fontWeight: FontWeight.w400,
                        )
                        )
                      ],
                    ),
                  ),

                const SizedBox(height: 11,),
              ],
            ),
          );
        },
      ),
    );
  }

  Future<void> openUrl(String url) async {
    final _url = Uri.parse(url);
    if (!await launchUrl(_url, mode: LaunchMode.externalApplication)) { // <--
      throw Exception('Could not launch $_url');
    }
  }
}
