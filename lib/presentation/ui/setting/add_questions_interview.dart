import 'package:firebase_database/firebase_database.dart';

import '../../widgets/import_all.dart';

class AddQuestionsInterview extends StatefulWidget {
  const AddQuestionsInterview({super.key});

  @override
  State<AddQuestionsInterview> createState() => _AddQuestionsInterviewState();
}

class _AddQuestionsInterviewState extends State<AddQuestionsInterview> {

  final databaseReference = FirebaseDatabase.instance.ref().child('QuestionsInterview');

  TextEditingController questionController = TextEditingController();
  TextEditingController answerController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: const Text('Add Questions Interview'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextField(
              controller: questionController,
              decoration: const InputDecoration(labelText: 'Question'),
            ),
            const SizedBox(height: 16.0),
            TextField(
              maxLines: 10,
              minLines: 1,
              controller: answerController,
              decoration: const InputDecoration(labelText: 'Answer'),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                addQuestion();
              },
              child: const Text('Add Question'),
            ),
          ],
        ),
      ),
    );
  }

  void addQuestion() async{

    String question = questionController.text.trim();
    String answer = answerController.text.trim();

    if (question.isNotEmpty && answer.isNotEmpty) {
      print("addQuestion");
      FirebaseDatabase.instance.reference().child("QuestionsInterview").push().set({
        'question': question,
        'answer': answer,
      }).then((value) {
        // Clear the text fields after adding the question
        questionController.clear();
        answerController.clear();

        // Show a success message or navigate to another screen
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Question added successfully!')),
        );
      }).catchError((error) {
        // Handle any errors
        print(error);
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Failed to add question')),
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
