import '../../../widgets/import_all.dart';
import 'AddOrUpdateLanguageScreen.dart';
import 'Language.dart';


class LanguageScreen extends StatefulWidget {
  final int categoryId;

  const LanguageScreen({super.key, required this.categoryId});
  @override
  _LanguageScreenState createState() => _LanguageScreenState();
}

class _LanguageScreenState extends State<LanguageScreen> {
  late List<Language> language;
  @override
  void initState() {
    _fetchLanguages();
    super.initState();

  }

  Future<void> _fetchLanguages() async {
    List<Language> projects =await LanguageDatabaseHelper.instance.getLanguagesByCategoryId(widget.categoryId);
    setState(() {
      language=projects;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('All Language'),
      ),
      body: language==null
          ? Center(
        child: Text('No projects found'),
      )
          :  language.isEmpty
          ? Center(
        child: Text('No projects found'),
      )
          : ListView.builder(
        itemCount: language.length,
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.only(left: 22, right: 22, top: 10),
            child: ListTile(
              title: Text(language[index].name),
              subtitle: Text(language[index].grade),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: const Icon(Icons.edit),
                    onPressed: () {
                      // Implement edit functionality
                      _editProject(language[index]);
                    },
                  ),
                  IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () {
                      // Implement delete functionality
                      _deleteProject(language[index]);
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
              builder: (context) => AddOrUpdateLanguageScreen(categoryId: widget.categoryId),
            ),
          ).then((value) {
            if (value != null && value) {
              // Refresh the list of projects after adding/updating
              _fetchLanguages();
            }
          });
        },
        child: Icon(Icons.add),
      ),
    );
  }

  // Implement edit functionality
  void _editProject(Language project) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AddOrUpdateLanguageScreen(categoryId: widget.categoryId,language: project,),
      ),
    ).then((value) {
      if (value != null && value) {
        // Refresh the list of projects after adding/updating
        _fetchLanguages();
      }
    });
  }

  // Implement delete functionality
  Future _deleteProject(Language project) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Confirm Deletion'),
          content: const Text('Are you sure you want to delete this Language?'),
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
                await LanguageDatabaseHelper.instance.deleteLanguages(project.id!);
                _fetchLanguages();
                Navigator.of(context).pop(false);
              },
            ),
          ],
        );
      },
    );
  }
}