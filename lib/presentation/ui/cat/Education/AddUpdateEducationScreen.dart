// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'Education.dart';
import 'EducationDatabaseHelper.dart';

class AddUpdateEducationScreen extends StatefulWidget {
  final int categoryId;
  final Education? education;

  const AddUpdateEducationScreen({super.key, required this.categoryId, this.education});

  @override
  _AddUpdateEducationScreenState createState() => _AddUpdateEducationScreenState();
}

class _AddUpdateEducationScreenState extends State<AddUpdateEducationScreen> {
  final TextEditingController _courseOrDegreeController = TextEditingController();
  final TextEditingController _schoolOrUniversityController = TextEditingController();
  final TextEditingController _gradeController = TextEditingController();
  DateTime _year = DateTime.now();

  @override
  void initState() {
    super.initState();
    if (widget.education != null) {
      _courseOrDegreeController.text = widget.education!.courseOrDegree;
      _schoolOrUniversityController.text = widget.education!.schoolOrUniversity;
      _gradeController.text = widget.education!.grade;
      _year = widget.education!.year;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.education != null ? 'Update Education' : 'Add Education'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _courseOrDegreeController,
              decoration: const InputDecoration(labelText: 'Course or Degree'),
            ),
            TextField(
              controller: _schoolOrUniversityController,
              decoration: const InputDecoration(labelText: 'School or University'),
            ),
            TextField(
              controller: _gradeController,
              decoration: const InputDecoration(labelText: 'Grade/Score'),
            ),
            const SizedBox(height: 16.0),
            Text('Year: ${DateFormat('yyyy').format(_year)}'),
            ElevatedButton(
              onPressed: () {
                _selectYear();
              },
              child: const Text('Select Year'),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _saveEducation();
        },
        child: const Icon(Icons.save),
      ),
    );
  }

  Future<void> _selectYear() async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: _year,
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (pickedDate != null) {
      setState(() {
        _year = pickedDate;
      });
    }
  }

  void _saveEducation() {
    String courseOrDegree = _courseOrDegreeController.text.trim();
    String schoolOrUniversity = _schoolOrUniversityController.text.trim();
    String grade = _gradeController.text.trim();

    if (courseOrDegree.isNotEmpty && schoolOrUniversity.isNotEmpty && grade.isNotEmpty) {
      Education newEducation = Education(
        categoryId: widget.categoryId,
        courseOrDegree: courseOrDegree,
        schoolOrUniversity: schoolOrUniversity,
        grade: grade,
        year: _year,
      );

      if (widget.education != null) {
        newEducation.id = widget.education!.id;
        _updateEducation(newEducation);
      } else {
        _addEducation(newEducation);
      }
    } else {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Error'),
          content: const Text('Please fill in all fields.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('OK'),
            ),
          ],
        ),
      );
    }
  }

  void _addEducation(Education education) async {
    await EducationDatabaseHelper.instance.insertEducation(education);
    Navigator.pop(context, true); // Return true to indicate success
  }

  void _updateEducation(Education education) async {
    await EducationDatabaseHelper.instance.updateEducation(education);
    Navigator.pop(context, true); // Return true to indicate success
  }
}
