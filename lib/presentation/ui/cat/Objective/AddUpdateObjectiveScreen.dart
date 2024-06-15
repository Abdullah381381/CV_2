// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';

import 'Objective.dart';
import 'ObjectiveDatabaseHelper.dart';

class AddUpdateObjectiveScreen extends StatefulWidget {
  final int categoryId;

  const AddUpdateObjectiveScreen({super.key, required this.categoryId});

  @override
  _AddUpdateObjectiveScreenState createState() => _AddUpdateObjectiveScreenState();
}

class _AddUpdateObjectiveScreenState extends State<AddUpdateObjectiveScreen> {
  late TextEditingController _objectiveController;
  late bool _isExistingData;

  @override
  void initState() {
    super.initState();
    _objectiveController = TextEditingController();
    _isExistingData = false;
    _checkExistingData();
  }

  @override
  void dispose() {
    _objectiveController.dispose();
    super.dispose();
  }

  Future<void> _checkExistingData() async {
    Objective? existingObjective = await ObjectiveDatabaseHelper.instance.getObjectiveByCategoryId(widget.categoryId);
    if (existingObjective != null) {
      setState(() {
        _isExistingData = true;
        _objectiveController.text = existingObjective.objective;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_isExistingData ? 'Update Objective' : 'Add Objective'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _objectiveController,
              decoration: const InputDecoration(labelText: 'Objective'),
              maxLines: 10, // Allow unlimited lines for objective
                minLines: 1,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _saveObjective();
        },
        child: const Icon(Icons.save),
      ),
    );
  }

  Future<void> _saveObjective() async {
    String objectiveText = _objectiveController.text.trim();

    if (objectiveText.isNotEmpty) {
      Objective objective = Objective(
        categoryId: widget.categoryId,
        objective: objectiveText,
      );

      if (_isExistingData) {
        // Update existing objective
        Objective? existingObjective = await ObjectiveDatabaseHelper.instance.getObjectiveByCategoryId(widget.categoryId);
        if (existingObjective != null) {
          objective.id = existingObjective.id;
          await ObjectiveDatabaseHelper.instance.updateObjective(objective);
        }
      } else {
        // Add new objective
        await ObjectiveDatabaseHelper.instance.insertObjective(objective);
      }

      // Return true to indicate success
      Navigator.pop(context, true);
    } else {
      // Show error message if objective is empty
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Error'),
            content: const Text('Please fill in the objective field.'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }
}
