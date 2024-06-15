import 'package:firebase_database/firebase_database.dart';

import '../../widgets/import_all.dart';

class AddCenters extends StatefulWidget {
  const AddCenters({super.key});

  @override
  State<AddCenters> createState() => _AddQuestionsInterviewState();
}

class _AddQuestionsInterviewState extends State<AddCenters> {

  final databaseReference = FirebaseDatabase.instance.ref().child('CourseCentres');

  TextEditingController nameController = TextEditingController();
  TextEditingController webController = TextEditingController();
  TextEditingController desController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: const Text('Add Approved course centres'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextField(
              controller: nameController,
              decoration: const InputDecoration(labelText: 'name'),
            ),
            const SizedBox(height: 16.0),
            TextField(
              controller: webController,
              decoration: const InputDecoration(labelText: 'Web'),
            ),
            const SizedBox(height: 16.0),
            TextField(
              maxLines: 10,
              minLines: 1,
              controller: desController,
              decoration: const InputDecoration(labelText: 'Description'),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                addQuestion();
              },
              child: const Text('Add'),
            ),
          ],
        ),
      ),
    );
  }

  void addQuestion() async{

    String name = nameController.text.trim();
    String weeb = webController.text.trim();
    String des = desController.text.trim();

    if (name.isNotEmpty && weeb.isNotEmpty&& des.isNotEmpty) {
      FirebaseDatabase.instance.reference().child("CourseCentres").push().set({
        'name': name,
        'web': weeb,
        'des': des,
      }).then((value) {
        // Clear the text fields after adding the question
        webController.clear();
        webController.clear();
        desController.clear();

        // Show a success message or navigate to another screen
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('CourseCentres added successfully!')),
        );
      }).catchError((error) {
        // Handle any errors
        print(error);
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Failed to add CourseCentres')),
        );
      }).onError((error, stackTrace){
        print(error);
      });

      // DatabaseReference ref = FirebaseDatabase.instance.ref("users/123");
      //
      // await ref.set({
      //   "name": "John",
      //   "age": 18,
      //   "address": {
      //     "line1": "100 Mountain View"
      //   }
      // });
    } else {
      print("answerxxxx");
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter both question and answer')),
      );
    }
  }
}
