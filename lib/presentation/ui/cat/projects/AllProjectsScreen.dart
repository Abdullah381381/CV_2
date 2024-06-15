import 'package:flutter/material.dart';

import 'AddUpdateProjectScreen.dart';
import 'Project.dart';
import 'ProjectDatabaseHelper.dart';


class AllProjectsScreen extends StatefulWidget {
  final int categoryId;

  AllProjectsScreen({required this.categoryId});

  @override
  _AllProjectsScreenState createState() => _AllProjectsScreenState();
}

class _AllProjectsScreenState extends State<AllProjectsScreen> {
  late List<Project> _projects;

  @override
  void initState() {
    super.initState();
    _fetchProjects();
  }

  Future<void> _fetchProjects() async {
    List<Project> projects = await ProjectDatabaseHelper.instance.getProjectsByCategoryId(widget.categoryId);
    setState(() {
      _projects = projects;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('All Projects'),
      ),
      body: _projects.isEmpty
          ? Center(
        child: Text('No projects found'),
      )
          : ListView.builder(
        itemCount: _projects.length,
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.only(left: 22, right: 22, top: 10),
            child: ListTile(
              title: Text(_projects[index].title),
              subtitle: Text(_projects[index].description),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: const Icon(Icons.edit),
                    onPressed: () {
                      // Implement edit functionality
                      _editProject(_projects[index]);
                    },
                  ),
                  IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () {
                      // Implement delete functionality
                      _deleteProject(_projects[index]);
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
          // Navigate to a screen to add new project
          // You can replace 'AddUpdateProjectScreen' with the actual screen you use for adding/updating project
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddUpdateProjectScreen(categoryId: widget.categoryId),
            ),
          ).then((value) {
            if (value != null && value) {
              // Refresh the list of projects after adding/updating
              _fetchProjects();
            }
          });
        },
        child: Icon(Icons.add),
      ),
    );
  }

  // Implement edit functionality
  void _editProject(Project project) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AddUpdateProjectScreen(categoryId: widget.categoryId,project: project,),
      ),
    ).then((value) {
      if (value != null && value) {
        // Refresh the list of projects after adding/updating
        _fetchProjects();
      }
    });
  }

  // Implement delete functionality
  Future _deleteProject(Project project) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Confirm Deletion'),
          content: const Text('Are you sure you want to delete this Project?'),
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
                await ProjectDatabaseHelper.instance.deleteProject(project.id!);
                _fetchProjects();
                Navigator.of(context).pop(false);
              },
            ),
          ],
        );
      },
    );
  }
}
