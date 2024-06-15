// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';

import 'Skill_modele.dart';
import 'SkillsDatabaseHelper.dart';

class AddSkillScreen extends StatefulWidget {
  final int categoryId;
  final Skill? skill;
  const AddSkillScreen({super.key, required this.categoryId,  this.skill});

  @override
  _AddSkillScreenState createState() => _AddSkillScreenState();
}

class _AddSkillScreenState extends State<AddSkillScreen> {
  final TextEditingController _nameController = TextEditingController();
  int _selectedLevel = 4; // Default level

  @override
  void initState() {
    super.initState();
    _nameController.text=widget.skill?.name??"";
    _selectedLevel=widget.skill?.level??4;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.skill == null ? 'Add Skill' : 'Edit Skill'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(
                labelText: 'Skill Name',
              ),
            ),
            const SizedBox(height: 16.0),
            const Text('Skill Level:', style: TextStyle(fontSize: 16.0)),
            Column(
              children: [
                for (int i = 1; i <= 5; i++)
                  RadioListTile<int>(
                    title: Text('Level $i'),
                    value: i,
                    groupValue: _selectedLevel,
                    onChanged: (value) {
                      setState(() {
                        _selectedLevel = value!;
                      });
                    },
                  ),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if(widget.skill!=null){
            _updateSkill();
          }else{
            _addSkill();
          }

        },
        child: const Icon(Icons.save),
      ),
    );
  }

  void _addSkill() async {
    String name = _nameController.text.trim();
    if (name.length<3) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Error'),
          content: const Text('Please enter a skill name.'),
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
      return;
    }

    Skill newSkill = Skill(
      categoryId: widget.categoryId,
      name: name,
      level: _selectedLevel,
    );

    await SkillsDatabaseHelper.instance.insertSkill(newSkill);
    Navigator.pop(context, true); // Return true to indicate success
  }

  void _updateSkill() async {
    String name = _nameController.text.trim();
    if (name.length<3) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Error'),
          content: const Text('Please enter a skill name.'),
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
      return;
    }

    Skill newSkill = Skill(
      id: widget.skill?.id??0,
      categoryId: widget.categoryId,
      name: name,
      level: _selectedLevel,
    );

    await SkillsDatabaseHelper.instance.updateSkill(newSkill);
    Navigator.pop(context, true); // Return true to indicate success
  }
}
