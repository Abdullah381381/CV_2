import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'PersonalDetails.dart';
import 'PersonalDetailsDatabaseHelper.dart';

class AddUpdatePersonalDetailsScreen extends StatefulWidget {
  final int categoryId;

  AddUpdatePersonalDetailsScreen({required this.categoryId});

  @override
  _AddUpdatePersonalDetailsScreenState createState() => _AddUpdatePersonalDetailsScreenState();
}

class _AddUpdatePersonalDetailsScreenState extends State<AddUpdatePersonalDetailsScreen> {
  late TextEditingController _nameController;
  late TextEditingController _addressController;
  late TextEditingController _emailController;
  late TextEditingController _notesController;
  late TextEditingController _phoneController;
  Uint8List? _photoBytes; // Store photo as bytes
  String _photoPath = ''; // Store photo path

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
    _addressController = TextEditingController();
    _emailController = TextEditingController();
    _phoneController = TextEditingController();
    _notesController = TextEditingController();
    _fetchPersonalDetails();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _addressController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  Future<void> _fetchPersonalDetails() async {
    PersonalDetails? personalDetails = await PersonalDetailsDatabaseHelper.instance.getPersonalDetailsByCategoryId(widget.categoryId);
    if (personalDetails != null) {
      setState(() {
        _nameController.text = personalDetails.name;
        _addressController.text = personalDetails.address;
        _emailController.text = personalDetails.email;
        _phoneController.text = personalDetails.phone;
        _notesController.text = personalDetails.notes;
        _photoBytes = personalDetails.photo;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add/Update Personal Details'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _nameController,
              decoration: InputDecoration(labelText: 'Name'),
            ),
            TextField(
              controller: _addressController,
              decoration: InputDecoration(labelText: 'Address'),
            ),
            TextField(
              controller: _emailController,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            TextField(
              controller: _phoneController,
              decoration: InputDecoration(labelText: 'Phone'),
            ),

            TextField(
              controller: _notesController,
              decoration: InputDecoration(labelText: 'Notes'),
            ),

            SizedBox(height: 16),

            _photoBytes != null
                ? Image.memory(
              _photoBytes!,
              height: 100,
              width: 100,
              fit: BoxFit.cover,
            )
                : Container(),

            SizedBox(height: 16),

            ElevatedButton(
              onPressed: () {
                _selectPhoto(context);
              },
              child: Text('Select Photo'),
            ),
            SizedBox(height: 16),
            // ElevatedButton(
            //   onPressed: () {
            //     _saveOrUpdatePersonalDetails();
            //   },
            //   child: Text('Save/Update'),
            // ),
          ],
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _saveOrUpdatePersonalDetails();
        },
        child: Icon(Icons.save),
      ),
    );
  }

  Future<void> _selectPhoto(BuildContext context) async {
    final ImagePicker _picker = ImagePicker();
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      final bytes = await image.readAsBytes();
      setState(() {
        _photoBytes = Uint8List.fromList(bytes);
        _photoPath = image.path;
      });
    }
  }

  Future<void> _saveOrUpdatePersonalDetails() async {
    String name = _nameController.text.trim();
    String address = _addressController.text.trim();
    String email = _emailController.text.trim();
    String phone = _phoneController.text.trim();
    String notes = _notesController.text.trim();

    if (name.isNotEmpty && address.isNotEmpty && notes.isNotEmpty && email.isNotEmpty && phone.isNotEmpty && _photoBytes != null) {
      PersonalDetails personalDetails = PersonalDetails(
        categoryId: widget.categoryId,
        name: name,
        address: address,
        email: email,
        phone: phone,
        notes: notes,
        photo: _photoBytes!,
      );

      PersonalDetails? existingPersonalDetails = await PersonalDetailsDatabaseHelper.instance.getPersonalDetailsByCategoryId(widget.categoryId);
      if (existingPersonalDetails != null) {
        // Update existing personal details
        personalDetails.id = existingPersonalDetails.id;
        await PersonalDetailsDatabaseHelper.instance.updatePersonalDetails(personalDetails);
      } else {
        // Add new personal details
        await PersonalDetailsDatabaseHelper.instance.insertPersonalDetails(personalDetails);
      }

      Navigator.pop(context);
    } else {
      // Show error message if any field is empty
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Please fill in all fields and select a photo.'),
        ),
      );
    }
  }
}
