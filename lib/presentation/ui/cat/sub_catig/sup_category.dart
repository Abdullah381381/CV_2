import 'package:cv_project/presentation/ui/cat/CategoryMedul.dart';
import 'package:cv_project/presentation/ui/cat/Education/AllEducationScreen.dart';
import 'package:cv_project/presentation/ui/cat/Language/LanguageScreen.dart';
import 'package:cv_project/presentation/ui/cat/Objective/AddUpdateObjectiveScreen.dart';
import 'package:cv_project/presentation/ui/cat/PDFScreen.dart';
import 'package:cv_project/presentation/ui/cat/Reference/ReferenceScreen.dart';
import 'package:cv_project/presentation/ui/cat/projects/AllProjectsScreen.dart';
import 'package:cv_project/presentation/ui/cat/skilles/SkillsScreen.dart';

import '../../../widgets/import_all.dart';
import '../Experience/AllExperiencesScreen.dart';
import '../PersonalDetails/AddUpdatePersonalDetailsScreen.dart';

class SubCategory extends StatefulWidget {
  final Category cat;
  const SubCategory({super.key, required this.cat});

  @override
  State<SubCategory> createState() => _SubCategoryState();
}

class _SubCategoryState extends State<SubCategory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextApp(
          text: widget.cat.name,
          textAlign: TextAlign.center,
          fontSize: 22,
          color: Colors.black,
        ),
      ),
      body: Column(
        children: [
          Expanded(child: SingleChildScrollView(
            padding: const EdgeInsets.only(left: 17,right: 17,top: 10,bottom: 10),
            child: Column(
              children: [
                design(text: "Person Details",icon: "user",widget: AddUpdatePersonalDetailsScreen(categoryId:widget.cat.id)),
                design(text: "Educational",icon: "educational",widget: AllEducationScreen(categoryId: widget.cat.id)),
                design(text: "Experience",icon: "Experience",widget: AllExperiencesScreen(categoryId: widget.cat.id)),
                design(text: "Skills",icon: "Skills",widget: SkillsScreen(categoryId: widget.cat.id)),
                design(text: "Objective",icon: "Objective",widget: AddUpdateObjectiveScreen(categoryId:  widget.cat.id)),
                design(text: "Projects",icon: "Project",widget: AllProjectsScreen(categoryId: widget.cat.id)),
                design(text: "Language",icon: "translate",widget: LanguageScreen(categoryId: widget.cat.id)),
                design(text: "Reference",icon: "refer",widget: ReferenceScreen(categoryId: widget.cat.id)),
              ],
            ),
          )),

          Padding(
            padding: EdgeInsets.only(bottom: MediaQuery.of(context).padding.bottom+20),
            child: ButtonApps(
              maxHeight: 45,maxWidth: 300,
              textButton: "pdf",
              colorsText: Colors.white,
              fontSize: 27,
              ontap: (){
                Go.to(context: context, page: PDFScreen(categoryId: widget.cat.id,));
              },
            ),
          )
        ],
      ),
    );
  }


  Widget design({required String text,icon,Widget? widget}){
    return InkWell(
      onTap: () async{
        if(widget!=null){
          Go.to(context: context, page: widget);
        }
      },
      child: Card(
        // margin: const EdgeInsets.only(left: 22,right: 22,bottom: 10),
        child: Padding(
          padding: const EdgeInsets.only(left: 17,right: 17,top: 15,bottom: 15),
          child:Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [

              Image.asset("assets/images/$icon.png",height: 30,width: 30,),
              const SizedBox(width: 20,),
              TextApp(
                text: text,
                textAlign: TextAlign.start,
                fontSize: 18,
                color: Colors.black,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
