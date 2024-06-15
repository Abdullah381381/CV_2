// ignore_for_file: unnecessary_null_comparison, library_private_types_in_public_api

import 'package:flutter/material.dart';

import 'AddUpdateEducationScreen.dart';
import 'Education.dart';
import 'EducationDatabaseHelper.dart';

class AllEducationScreen extends StatefulWidget {
  final int categoryId;

  const AllEducationScreen({super.key, required this.categoryId});

  @override
  _AllEducationScreenState createState() => _AllEducationScreenState();
}

class _AllEducationScreenState extends State<AllEducationScreen> {
  late List<Education> _educations;

  @override
  void initState() {
    super.initState();
    _fetchEducation();
  }

  Future<void> _fetchEducation() async {
    List<Education> educations = await EducationDatabaseHelper.instance.getEducationByCategoryId(widget.categoryId);
    setState(() {
      _educations = educations;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('All Education'),
      ),
      body: _educations==null
          ? const Center(
        child: Text('No education records found'),
      )
          : _educations.isEmpty
          ? const Center(
        child: Text('No education records found'),
      )
          : ListView.builder(
        itemCount: _educations.length,
        itemBuilder: (context, index) {
          return
          //   ListTile(
          //   title: Text(_educations[index].courseOrDegree),
          //   subtitle: Text(_educations[index].schoolOrUniversity),
          //   onTap: () {
          //     // Handle tapping on an education record if needed
          //   },
          // );
            Card(
              margin: const EdgeInsets.only(left: 22,right: 22,top: 10),
              child:  ListTile(
                title: Text(_educations[index].courseOrDegree),
                subtitle:  Text(_educations[index].schoolOrUniversity),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.edit),
                      onPressed: () {
                        // Implement edit functionality
                        _editEducation(_educations[index]);
                      },
                    ),
                    IconButton(
                      icon: const Icon(Icons.delete),
                      onPressed: () {
                        // Implement delete functionality
                        _deleteEducation(_educations[index]);
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
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddUpdateEducationScreen(categoryId: widget.categoryId),
            ),
          ).then((value) {
            if (value != null && value) {
              _fetchEducation();
            }
          });
        },
        child: const Icon(Icons.add),
      ),
    );
  }


  void _editEducation(Education education) async{
    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AddUpdateEducationScreen(categoryId: widget.categoryId,education: education,),
      ),
    );
    setState(() {
      _fetchEducation();
    });
  }
  //
  void _deleteEducation(Education education) async {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Confirm Deletion'),
          content: const Text('Are you sure you want to delete this Education?'),
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
                await EducationDatabaseHelper.instance.deleteEducation(education.id!);
                _fetchEducation();
                Navigator.of(context).pop(false);
              },
            ),
          ],
        );
      },
    );
  }
}
