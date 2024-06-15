import 'package:flutter/material.dart';
import 'Reference.dart';
import 'ReferenceDatabaseHelper.dart'; // Adjust the import based on your project structure

class ReferenceScreen extends StatefulWidget {
  final int categoryId;

  ReferenceScreen({required this.categoryId});

  @override
  _ReferenceScreenState createState() => _ReferenceScreenState();
}

class _ReferenceScreenState extends State<ReferenceScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _universityController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Check if data exists for the categoryId
    _checkExistingData();
  }

  _checkExistingData() async {
    Reference? existingReference = await ReferenceDatabaseHelper.instance.getReferenceByCategoryId(widget.categoryId);

    if (existingReference != null) {
      _nameController.text = existingReference.name;
      _universityController.text = existingReference.university;
      _phoneController.text = existingReference.phone;
      _emailController.text = existingReference.email;
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add/Update Reference'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(labelText: 'Name'),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _universityController,
              decoration: const InputDecoration(labelText: 'University'),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _phoneController,
              decoration: const InputDecoration(labelText: 'Phone'),
              keyboardType: TextInputType.phone,
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _emailController,
              decoration: const InputDecoration(labelText: 'Email'),
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () async {
                Reference reference = Reference(
                  name: _nameController.text,
                  university: _universityController.text,
                  phone: _phoneController.text,
                  email: _emailController.text,
                  categoryId: widget.categoryId,
                );

                // Check if a reference exists for this category
                Reference? existingReference = await ReferenceDatabaseHelper.instance.getReferenceByCategoryId(widget.categoryId);

                if (existingReference != null) {
                  reference.id = existingReference.id;
                  await ReferenceDatabaseHelper.instance.updateReference(reference);
                } else {
                  await ReferenceDatabaseHelper.instance.insertReference(reference);
                }

                Navigator.pop(context); // Navigate back to the previous screen
              },
              child: const Text('Save'),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    _universityController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
    super.dispose();
  }
}
