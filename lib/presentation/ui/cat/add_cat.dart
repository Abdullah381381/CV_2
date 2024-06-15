import 'package:cv_project/presentation/ui/cat/CategoryMedul.dart';

import '../../widgets/import_all.dart';
import 'CategoryDatabaseHelper.dart';

class AddCat extends StatefulWidget {
  final Category? data;
  const AddCat({super.key, this.data});

  @override
  State<AddCat> createState() => _AddCatState();
}

class _AddCatState extends State<AddCat> {
  TextEditingController nameController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    nameController.text=widget.data?.name??"";
  }
  @override
  Widget build(BuildContext context) {
    return HidenKeyBoard(
        widgetScreen: Scaffold(
      appBar: AppBar(),
      body:  Form(
          key: _formKey,
          child:SingleChildScrollView(
            padding: const EdgeInsets.only(left: 22,right: 22,top: 20,bottom: 100),
            child: Column(
              children: [

                EditTextBorder(
                  controller: nameController,
                  onChanged: (e){},
                  validator: (e) {
                    if (e!.isEmpty || e.length < 2) {
                      return "name";
                    }
                    return null;
                  },
                  enabled: true,
                  hintText: "name",
                  labelText: "name",
                  prefixIcon: Image.asset("assets/images/user.png",height: 20,width: 20,),
                  obscureText: false,
                ),

                const SizedBox(height:27,),

                ButtonApps(
                  ontap: (){
                    if (_formKey.currentState!.validate()) {
                      if(widget.data?.name ==null){
                        _addCategory();
                      }else{
                        widget.data?.name=nameController.text;
                        print(widget.data?.name);
                        updateCategory(widget.data!);
                      }

                    }
                  },
                  textButton: "save",
                  colorsButton: primary2Color,
                  colorsText: Colors.white,
                  fontSize: 17,
                  maxHeight: 45,
                  maxWidth: MediaQuery.of(context).size.width*.78,
                  fontWeight: FontWeight.w400,
                ),
              ],
            ),
          ),
        ),
      ));
  }

  void _addCategory() async {
    String categoryName = nameController.text.trim();
    if (categoryName.isNotEmpty) {
      int id = await CategoryDatabaseHelper.instance.insertCategory({'name': categoryName});
      print('Category added with ID: $id');
      nameController.clear();
      Navigator.pop(context);
      ScaffoldMessenger.of(context).showSnackBar(
         SnackBar(
          content: Text("Category added with ID: $id"),
        ),
      );
      setState(() {});
    } else {
      print('Category name cannot be empty');
    }
  }

  void updateCategory(Category category) async {
    // Update category name
    // updatedCategory['name'] = 'Updated Name';

    // Perform update operation
    int rowsAffected = await CategoryDatabaseHelper.instance.updateCategory(category);
    if (rowsAffected > 0) {
      print('Category updated successfully');
      Navigator.pop(context);
    } else {
      print('Failed to update category');
    }
  }
}
