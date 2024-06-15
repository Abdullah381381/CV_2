// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';

import 'Project.dart';
import 'ProjectDatabaseHelper.dart';

class AddUpdateProjectScreen extends StatefulWidget {
  final int categoryId;
  final Project? project;

  const AddUpdateProjectScreen({super.key, required this.categoryId, this.project});

  @override
  _AddUpdateProjectScreenState createState() => _AddUpdateProjectScreenState();
}

class _AddUpdateProjectScreenState extends State<AddUpdateProjectScreen> {
  late TextEditingController _titleController;
  late TextEditingController _descriptionController;

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController(text: widget.project?.title ?? '');
    _descriptionController = TextEditingController(text: widget.project?.description ?? '');
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.project != null ? 'Update Project' : 'Add Project'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _titleController,
              decoration: InputDecoration(labelText: 'Title'),
            ),
            TextField(
              controller: _descriptionController,
              decoration: InputDecoration(labelText: 'Description'),
              maxLines: null, // Allow unlimited lines for description
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _saveProject();
        },
        child: Icon(Icons.save),
      ),
    );
  }

  Future<void> _saveProject() async {
    String title = _titleController.text.trim();
    String description = _descriptionController.text.trim();

    if (title.isNotEmpty && description.isNotEmpty) {
      Project project = Project(
        categoryId: widget.categoryId,
        title: title,
        description: description,
      );

      if (widget.project != null) {
        // Update existing project
        project.id = widget.project!.id;
        await ProjectDatabaseHelper.instance.updateProject(project);
      } else {
        // Add new project
        await ProjectDatabaseHelper.instance.insertProject(project);
      }

      // Return true to indicate success
      Navigator.pop(context, true);
    } else {
      // Show error message if any field is empty
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Error'),
            content: Text('Please fill in all fields.'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }
}
