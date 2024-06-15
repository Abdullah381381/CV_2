// ignore_for_file: use_build_context_synchronously, library_private_types_in_public_api, unnecessary_null_comparison

import 'package:cv_project/presentation/ui/cat/skilles/AddSkillScreen.dart';
import 'package:flutter/material.dart';

import 'Skill_modele.dart';
import 'SkillsDatabaseHelper.dart';

class SkillsScreen extends StatefulWidget {
  final int categoryId;

  const SkillsScreen({super.key, required this.categoryId});

  @override
  _SkillsScreenState createState() => _SkillsScreenState();
}

class _SkillsScreenState extends State<SkillsScreen> {
  late List<Skill> _skills;

  @override
  void initState() {
    super.initState();
    _fetchSkills();
  }

  Future<void> _fetchSkills() async {
    List<Skill> skills = await SkillsDatabaseHelper.instance.getSkillsByCategoryId(widget.categoryId);
    setState(() {
      _skills = skills;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Skills'),
      ),
      body: _skills==null
          ? const Center(
        child: Text('No skills found'),
      )
          :_skills.isEmpty
          ? const Center(
        child: Text('No skills found'),
      )
          : ListView.builder(
        itemCount: _skills.length,
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.only(left: 22,right: 22,top: 10),
            child:  ListTile(
              title: Text(_skills[index].name),
              subtitle: Text('Level: ${_skills[index].level}'),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: const Icon(Icons.edit),
                    onPressed: () {
                      // Implement edit functionality
                      _editSkill(_skills[index]);
                    },
                  ),
                  IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () {
                      // Implement delete functionality
                      _deleteSkill(_skills[index]);
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Implement add functionality
          _addSkill();
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  void _editSkill(Skill skill) async{
    await Navigator.push(
      context,
      MaterialPageRoute(builder: (ctx) => AddSkillScreen(categoryId: widget.categoryId,skill:skill)),
    );
    setState(() {
      _fetchSkills();
    });
  }

  void _deleteSkill(Skill skill) async {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Confirm Deletion'),
          content: const Text('Are you sure you want to delete this skill?'),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop(false);
              },
            ),
            TextButton(
              child: const Text('Delete'),
              onPressed: () async{
                await SkillsDatabaseHelper.instance.deleteSkill(skill.id!);
                _fetchSkills();
                Navigator.of(context).pop(false);
              },
            ),
          ],
        );
      },
    );
  }

  void _addSkill() async{
   await Navigator.push(
      context,
      MaterialPageRoute(builder: (ctx) => AddSkillScreen(categoryId: widget.categoryId)),
    );
   setState(() {
     _fetchSkills();
   });
  }
}
