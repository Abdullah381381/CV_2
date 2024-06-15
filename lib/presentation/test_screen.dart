import 'package:bottom_bar_matu/components/colors.dart';
import 'package:cv_project/presentation/widgets/edit_text.dart';
import 'package:cv_project/presentation/widgets/import_all.dart';

class TestScreen extends StatefulWidget {
  const TestScreen({super.key});

  @override
  State<TestScreen> createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  List one=["Reels","You","Chat","Guides","Diaa"];
  List two=["Anunymous post","Feeling","Chat","Guides","Diaa"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: colorRed,
        // leading: IconButton(icon: Icon(Icons.menu, color: Colors.white), onPressed: () {}),
        iconTheme: const IconThemeData(color: Colors.white),
        actions: [
          Row(
            children: [
              SizedBox(width: 10,),
              const Icon(Icons.share,textDirection: TextDirection.rtl,size: 30,),
              SizedBox(width: 20,),
              const Icon(Icons.search,textDirection: TextDirection.rtl,size: 35,),
              SizedBox(width: 10,),
            ],
          )
        ],

      ),
      drawer: Drawer(),
      body: SingleChildScrollView(
        child: Column(
          children: [

            CachedNetworkImageApp(height: 200, width: MediaQuery.of(context).size.width,
                imageUrl: "https://marketplace.canva.com/EAFpkDpoQWE/2/0/1600w/canva-red-and-blue-colorful-school-photo-collage-gk3O6qgMcDs.jpg"),

            Container(
              height: 40, width: MediaQuery.of(context).size.width,
              color: Colors.red,
              padding: const EdgeInsets.only(left: 18,right: 18,top: 7),
              child: const TextApp(
                text: "Group by Egyption Google Flutter",
                color: Colors.white,
                textAlign: TextAlign.start,
                fontSize: 20,
              ),
            ),


            firstWidget(),

            const SizedBox(height: 7,),
            Divider(thickness: 5,color: Colors.grey.withOpacity(.3),),
            Container(
          padding: const EdgeInsets.only(left: 18,right: 18,top: 7),
          child:Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [

                Row(
                  children: [
                    const TextApp(
                      text: "Featured",
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w700,

                    ),
                    const SizedBox(width: 5,),
                    Icon(Icons.access_time,size: 17,color: Colors.grey.withOpacity(.94),),

                  ],
                ),

               const SizedBox(width: 5,),
                const Icon(Icons.arrow_drop_down),

              ],
            ),
            ),

            const SizedBox(height: 7,),
            Divider(thickness: 5,color: Colors.grey.withOpacity(.3),),

            Container(
              padding: const EdgeInsets.only(left: 18,right: 18,top: 7),
              child:Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child:
                const CachedNetworkImageApp(height: 40, width: 40,
                    imageUrl: "https://marketplace.canva.com/EAFpkDpoQWE/2/0/1600w/canva-red-and-blue-colorful-school-photo-collage-gk3O6qgMcDs.jpg"),
                ),
                const SizedBox(width: 7,),
                const Expanded(child:SizedBox(height: 40,child:
                  EditTextBorder(
                  enabled: true,
                  hintText: "Write Something",
                  labelText: "Write Something",
                  maxLine: 1,
                  obscureText: false,
                  borderRadius: 40,
                )
                ),
                ),
                const SizedBox(width: 7,),
                const Icon(Icons.filter),
              ],
            ),
            ),
            const SizedBox(height: 7,),
            SizedBox(
              height: 40,
              child: ListView.builder(
                  itemCount: two.length,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.only(left: 18,right: 18,top: 7),
                  itemBuilder: (context,idex){
                    return Container(
                        height: 40,
                        // width: 200,
                        margin: const EdgeInsetsDirectional.only(end: 10),
                        padding: const EdgeInsets.only(left: 18,right: 18,top: 0),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(1008),
                            color:Colors.grey.withOpacity(.2)
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [



                             Icon(Icons.pin_drop_rounded,size: 19,color: Colors.red,),
                              const SizedBox(width: 5,),

                            TextApp(
                              text: two[idex],
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w700,

                            ),

                          ],
                        )
                    );
                  }),
            ),

            const SizedBox(height: 7,),
            Divider(thickness: 5,color: Colors.grey.withOpacity(.3),),
            Container(
          padding: const EdgeInsets.only(left: 18,right: 18,top: 7),
          child:const Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [

                TextApp(
                  text: "Most relevant",
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.w700,

                ),

                Icon(Icons.sort),

              ],
            ),
            ),

            const SizedBox(height: 7,),
            Divider(thickness: 5,color: Colors.grey.withOpacity(.3),),

            Container(
              padding: const EdgeInsets.only(left: 18,right: 18,top: 7),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
              ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child:
                  CachedNetworkImageApp(height: 40, width: 40,
                      imageUrl: "https://marketplace.canva.com/EAFpkDpoQWE/2/0/1600w/canva-red-and-blue-colorful-school-photo-collage-gk3O6qgMcDs.jpg"),
              ),
                  const SizedBox(width: 7,),
                  Expanded(child:
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextApp(
                        text: "Most relevant",
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.w700,

                      ),
                      Row(
                        children: [

                          const TextApp(
                            text: "8h",
                            color: Colors.grey,
                            textAlign: TextAlign.start,
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                          const SizedBox(width: 5,),
                          const Icon(Icons.public,textDirection: TextDirection.rtl,size: 15,),

                        ],
                      ),
                    ],
                  )
                  ),

                  Icon(Icons.more_horiz),

                ],
              ),
            ),

            
          ],
        ),
      ),
    );
  }

  firstWidget(){
    return Container(
      padding: const EdgeInsets.only(left: 18,right: 18,top: 7),
      child:Column(
        children: [
          const Row(
            children: [
              TextApp(
                text: "FlutterEgypt",
                color: Colors.black,
                textAlign: TextAlign.start,
                fontSize: 25,
                fontWeight: FontWeight.w700,
              ),

              SizedBox(width: 10,),
              Icon(Icons.arrow_back_ios_new,textDirection: TextDirection.rtl,)
            ],
          ),

          Row(
            children: [

              const Icon(Icons.public,textDirection: TextDirection.rtl,size: 15,),
              const SizedBox(width: 5,),
              const TextApp(
                text: "Public group",
                color: Colors.grey,
                textAlign: TextAlign.start,
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),

              const SizedBox(width: 5,),
              TextApp(
                text: "75K",
                color: Colors.black.withOpacity(.8),
                textAlign: TextAlign.start,
                fontSize: 18,
                fontWeight: FontWeight.w700,
              ),
              const SizedBox(width: 5,),
              TextApp(
                text: "members",
                color: Colors.grey.withOpacity(.8),
                textAlign: TextAlign.start,
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),

            ],
          ),


          const SizedBox(height: 15,),
          Row(
            children: [


              Expanded(child:
              InkWell(
                  onTap: (){
                    print("button");
                  },
                  child:  Container(
                      height: 40,
                      width: 200,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color:Colors.grey.withOpacity(.4)
                      ),
                      child:const Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.group,size: 17,),
                          SizedBox(width: 5,),
                          TextApp(
                            text: "Joind",
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w700,

                          ),
                          SizedBox(width: 5,),
                          Icon(Icons.arrow_drop_down),

                        ],
                      )
                  )
              )
              ),

              const SizedBox(width: 10,),

              Expanded(child:
              InkWell(
                onTap: (){
                  print("button");
                },
                child:   Container(
                    height: 40,
                    width: 200,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color:Colors.red
                    ),


                    child:const Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.people_alt_outlined,size: 17,color: Colors.white,),
                        SizedBox(width: 5,),
                        TextApp(
                          text: "Invite",
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w700,

                        ),

                      ],
                    )
                ),
              )
              ),
            ],
          ),

          const SizedBox(height: 10,),
          SizedBox(
            height: 40,
            child: ListView.builder(
                itemCount: one.length,
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                // padding: const EdgeInsets.only(left: 18,right: 18,top: 7),
                itemBuilder: (context,idex){
                  return Container(
                      height: 40,
                      // width: 200,
                      margin: const EdgeInsetsDirectional.only(end: 10),
                      padding: const EdgeInsets.only(left: 18,right: 18,top: 0),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(1008),
                          color:Colors.grey.withOpacity(.2)
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          if(idex==1)...[


                            ClipRRect(
                              borderRadius: BorderRadius.circular(100),
                              child:
                              const CachedNetworkImageApp(height: 25, width: 25,
                                  imageUrl: "https://marketplace.canva.com/EAFpkDpoQWE/2/0/1600w/canva-red-and-blue-colorful-school-photo-collage-gk3O6qgMcDs.jpg"),
                            ),
                            const SizedBox(width: 5,)
                          ],
                          TextApp(
                            text: one[idex],
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w700,

                          ),

                        ],
                      )
                  );
                }),
          )
        ],
      ),
    );
  }
}
