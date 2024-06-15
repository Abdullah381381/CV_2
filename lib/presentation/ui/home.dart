
import 'package:cv_project/presentation/ui/cat/add_cat.dart';
import 'package:cv_project/presentation/ui/setting/AddQuestionScreen.dart';
import 'package:cv_project/presentation/ui/setting/FamousQuestionsScreen.dart';
import 'package:cv_project/presentation/ui/setting/setting.dart';
import 'package:cv_project/presentation/ui/web.dart';

import '../widgets/import_all.dart';
import 'cat/CategoryMedul.dart';
import 'cat/CategoryDatabaseHelper.dart';
import 'cat/pdfs/PdfUpdateScreen.dart';
import 'cat/sub_catig/sup_category.dart';


class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: primary2Color,
        tooltip: 'Increment',
        onPressed: () async{
          await  Navigator.push(
            context,
            MaterialPageRoute(builder: (ctx) => const AddCat()),
          );
          setState(() {

          });
        },
        child: const Icon(Icons.add, color: Colors.white, size: 28),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Row(),
          SizedBox(height:  MediaQuery.of(context).padding.top+10,),
           Padding(
             padding: const EdgeInsets.only(left: 22,right: 22),
           child: Row(
             mainAxisAlignment: MainAxisAlignment.spaceBetween,
             children: [

               InkWell(
                 onTap: (){
                   // Go.to(context: context, page: FamousQuestionsCvScreen());
                   // Go.to(context: context, page: AddQuestionScreen());
                   Go.to(context: context, page: const SettingApp());
                 },
                 child: const Icon(Icons.settings,size: 40,),
               ),
               // InkWell(
               //   onTap: (){
               //     Go.to(context: context, page: PdfUpdateScreen());
               //   },
               //   child: Image.asset("assets/images/system-update.png",height: 40,width: 40,),
               // ),
               const TextApp(
                 text: "All Cvs",
                 textAlign: TextAlign.center,
                 fontSize: 22,
                 color: Colors.black,
               ),

               InkWell(
                 onTap: (){
                   Go.to(context: context, page: const WebViewExample());
                 },
                 child: Image.asset("assets/images/world-wide-web.png",height: 40,width: 40,),
               ),


             ],
           ),
           ),

          const SizedBox(height:30,),

          Expanded(
            child:

            FutureBuilder<List<Map<String, dynamic>>>(
              future: CategoryDatabaseHelper.instance.getCategories(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return const SizedBox(
                  height: 30,width: 30,
                  child:  CircularProgressIndicator(),
                );
                }
                List<Category> categories = [];
                for (var categoryData in snapshot.data!) {
                  categories.add(Category(
                    id: categoryData['id'],
                    name: categoryData['name'],
                  ));
                }
                return Expanded(
                  child: categories.isEmpty?
                  const Center(
                    child: TextApp(
                      text: "Add to list from the button below",
                      textAlign: TextAlign.center,
                      fontSize: 22,
                      color: Colors.black,
                    ),
                  )
                      :
                  ListView.builder(
                      itemCount: categories.length,
                      padding: const EdgeInsets.all(0),
                      itemBuilder: (context,index){
                        return InkWell(
                          onTap: () async{
                            Go.to(context: context, page: SubCategory(cat:categories[index]));
                          },
                          child: Card(
                            margin: const EdgeInsets.only(left: 22,right: 22,bottom: 10),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 17,right: 17,top: 10,bottom: 10),
                              child:Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  TextApp(
                                    text: categories[index].name,
                                    textAlign: TextAlign.center,
                                    fontSize: 16,
                                    color: Colors.black,
                                  ),

                                  Row(
                                    children: [

                                      IconButton(icon: const Icon(Icons.delete),onPressed: () async{
                                        return showDialog(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return AlertDialog(
                                              title: const Text('Confirm Deletion'),
                                              content: const Text('Are you sure you want to delete this category?'),
                                              actions: <Widget>[
                                                TextButton(
                                                  child: const Text('Cancel'),
                                                  onPressed: () {
                                                    Navigator.of(context).pop(false);
                                                  },
                                                ),
                                                TextButton(
                                                  child: const Text('Delete'),
                                                  onPressed: () {

                                                    deleteCategory(categories[index].id);
                                                    Navigator.of(context).pop(false);
                                                  },
                                                ),
                                              ],
                                            );
                                          },
                                        );
                                        setState(() {

                                        });
                                      },),

                                      IconButton(icon: const Icon(Icons.edit),onPressed: () async{
                                        var xx = await  Navigator.push(
                                          context,
                                          MaterialPageRoute(builder: (ctx) => AddCat(data:categories[index])),
                                        );

                                        setState(() {

                                        });
                                      },),
                                    ],
                                  ),

                                ],
                              ),
                            ),
                          ),
                        );
                      }),
                );
              },
            ),
          )
        ],
      ),
    );
  }

  void deleteCategory(int categoryId) async {
    int rowsDeleted = await CategoryDatabaseHelper.instance.deleteCategory(categoryId);
    if (rowsDeleted > 0) {
      print('Category deleted successfully');
    } else {
      print('Failed to delete category');
    }
    setState(() {

    });
  }
}



