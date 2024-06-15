// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'Experience.dart';
import 'ExperienceDatabaseHelper.dart';

class AddUpdateExperienceScreen extends StatefulWidget {
  final int categoryId;
  final Experience? experience;

  const AddUpdateExperienceScreen({super.key, required this.categoryId, this.experience});

  @override
  _AddUpdateExperienceScreenState createState() => _AddUpdateExperienceScreenState();
}

class _AddUpdateExperienceScreenState extends State<AddUpdateExperienceScreen> {
  final TextEditingController _companyNameController = TextEditingController();
  final TextEditingController _jobTitleController = TextEditingController();
  final TextEditingController _detailsController = TextEditingController();

  DateTime _startDate = DateTime.now();
  DateTime _endDate = DateTime.now();

  @override
  void initState() {
    super.initState();
    if (widget.experience != null) {
      _companyNameController.text = widget.experience!.companyName;
      _jobTitleController.text = widget.experience!.jobTitle;
      _startDate = widget.experience!.startDate;
      _endDate = widget.experience!.endDate;
      _detailsController.text = widget.experience!.details;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.experience != null ? 'Update Experience' : 'Add Experience'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _companyNameController,
              decoration: InputDecoration(labelText: 'Company Name'),
              minLines: 1,
              maxLines: 3, // Adjust maxLines as needed
            ),
            TextField(
              controller: _jobTitleController,
              decoration: InputDecoration(labelText: 'Job Title'),
              minLines: 1,
              maxLines: 3, // Adjust maxLines as needed
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: _detailsController,
              decoration: InputDecoration(labelText: 'Details'),
              minLines: 1,
              maxLines: 3, // Adjust maxLines as needed
            ),
            SizedBox(height: 16.0),
            Text('Start Date: ${DateFormat('yyyy-MM-dd').format(_startDate)}'),
            ElevatedButton(
              onPressed: () {
                _selectDate(true);
              },
              child: Text('Select Start Date'),
            ),
            SizedBox(height: 16.0),
            Text('End Date: ${DateFormat('yyyy-MM-dd').format(_endDate)}'),
            ElevatedButton(
              onPressed: () {
                _selectDate(false);
              },
              child: Text('Select End Date'),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _saveExperience();
        },
        child: Icon(Icons.save),
      ),
    );
  }

  Future<void> _selectDate(bool isStartDate) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: isStartDate ? _startDate : _endDate,
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
    );
    if (pickedDate != null) {
      setState(() {
        if (isStartDate) {
          _startDate = pickedDate;
        } else {
          _endDate = pickedDate;
        }
      });
    }
  }

  void _saveExperience() {
    String companyName = _companyNameController.text.trim();
    String jobTitle = _jobTitleController.text.trim();
    String details=_detailsController.text.trim();
    if (companyName.isEmpty || jobTitle.isEmpty || details.isEmpty) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Error'),
          content: Text('Please enter all fields.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('OK'),
            ),
          ],
        ),
      );
      return;
    }

    Experience newExperience = Experience(
      categoryId: widget.categoryId,
      companyName: companyName,
      jobTitle: jobTitle,
      startDate: _startDate,
      endDate: _endDate,
      details: details,
    );

    if (widget.experience != null) {
      newExperience.id = widget.experience!.id;
      _updateExperience(newExperience);
    } else {
      _addExperience(newExperience);
    }
  }

  void _addExperience(Experience experience) async {
    await ExperienceDatabaseHelper.instance.insertExperience(experience);
    Navigator.pop(context, true); // Return true to indicate success
  }

  void _updateExperience(Experience experience) async {
    await ExperienceDatabaseHelper.instance.updateExperience(experience);
    Navigator.pop(context, true); // Return true to indicate success
  }
}
