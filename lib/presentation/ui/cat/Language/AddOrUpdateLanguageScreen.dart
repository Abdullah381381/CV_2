import 'package:flutter/material.dart';
import 'Language.dart';

class AddOrUpdateLanguageScreen extends StatefulWidget {
  final Language? language;
  final int categoryId;


  const AddOrUpdateLanguageScreen({Key? key, this.language, required this.categoryId}) : super(key: key);

  @override
  _AddOrUpdateLanguageScreenState createState() => _AddOrUpdateLanguageScreenState();
}

class _AddOrUpdateLanguageScreenState extends State<AddOrUpdateLanguageScreen> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _nameController;
  late TextEditingController _gradeController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.language?.name ?? '');
    _gradeController = TextEditingController(text: widget.language?.grade ?? '');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.language == null ? 'Add Language' : 'Update Language'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(labelText: 'Name'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the language name';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _gradeController,
                decoration: const InputDecoration(labelText: 'Grade'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the grade';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                   
                    if (widget.language == null) {
                      final language = Language(
                        name: _nameController.text,
                        grade: _gradeController.text, categoryId: widget.categoryId,
                      );
                      await LanguageDatabaseHelper.instance.insertLanguage(language);
                    } else {
                      final language = Language(
                        categoryId: widget.language?.categoryId ?? 0,
                        name: _nameController.text,
                        grade: _gradeController.text,
                        id: widget.language?.id
                      );
                      await LanguageDatabaseHelper.instance.updateLanguage(language);
                    }
                    Navigator.pop(context,true);
                  }
                },
                child: Text(widget.language == null ? 'Add' : 'Update'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    _gradeController.dispose();
    super.dispose();
  }
}
