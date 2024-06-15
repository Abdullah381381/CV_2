// ignore_for_file: unnecessary_null_comparison, library_private_types_in_public_api

import 'package:cv_project/presentation/ui/cat/Experience/AddUpdateExperienceScreen.dart';
import 'package:flutter/material.dart';

import 'Experience.dart';
import 'ExperienceDatabaseHelper.dart';

class AllExperiencesScreen extends StatefulWidget {
  final int categoryId;

  const AllExperiencesScreen({super.key, required this.categoryId});

  @override
  _AllExperiencesScreenState createState() => _AllExperiencesScreenState();
}

class _AllExperiencesScreenState extends State<AllExperiencesScreen> {
  late List<Experience> _experiences;

  @override
  void initState() {
    super.initState();
    _fetchExperiences();
  }

  Future<void> _fetchExperiences() async {
    List<Experience> experiences =
    await ExperienceDatabaseHelper.instance.getExperiencesByCategoryId(widget.categoryId);
    setState(() {
      _experiences = experiences;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('All Experiences'),
      ),
      body: _experiences==null
          ? const Center(
        child: Text('No experiences found'),
      )
          :_experiences.isEmpty
          ? const Center(
        child: Text('No experiences found'),
      )
          : ListView.builder(
        itemCount: _experiences.length,
        itemBuilder: (context, index) {
          return
          //   ListTile(
          //   title: Text(_experiences[index].companyName),
          //   subtitle: Text(_experiences[index].jobTitle),
          //   onTap: () {
          //     // Navigate to the update experience screen
          //     // Pass the selected experience to the update screen
          //   },
          // );
            Card(
              margin: const EdgeInsets.only(left: 22,right: 22,top: 10),
              child:  ListTile(
                title:  Text("companyName : ${_experiences[index].companyName}"),
                subtitle: Text("jobTitle : ${_experiences[index].jobTitle}"),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.edit),
                      onPressed: () {
                        _editSkill(_experiences[index]);
                      },
                    ),
                    IconButton(
                      icon: const Icon(Icons.delete),
                      onPressed: () {
                        _deleteExperience(_experiences[index]);
                      },
                    ),
                  ],
                ),
              ),
            );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async{
      await Navigator.push(
        context,
        MaterialPageRoute(builder: (ctx) => AddUpdateExperienceScreen(categoryId: widget.categoryId)),
      );
      setState(() {
        _fetchExperiences();
      });
    }
  ,
        child: const Icon(Icons.add),
      ),
    );
  }




  void _editSkill(Experience experience) async{
    await Navigator.push(
      context,
      MaterialPageRoute(builder: (ctx) => AddUpdateExperienceScreen(categoryId: widget.categoryId,experience: experience,)),
    );
    setState(() {
      _fetchExperiences();
    });
  }

  void _deleteExperience(Experience experience) async {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Confirm Deletion'),
          content: const Text('Are you sure you want to delete this Experience?'),
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
                await ExperienceDatabaseHelper.instance.deleteExperience(experience.id!);
                _fetchExperiences();
                Navigator.of(context).pop(false);
              },
            ),
          ],
        );
      },
    );
  }

}
