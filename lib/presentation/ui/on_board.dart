
import 'package:bottom_bar_matu/bottom_bar/bottom_bar_bubble.dart';
import 'package:bottom_bar_matu/bottom_bar_item.dart';
import 'package:cv_project/presentation/ui/profile/edit_profile.dart';
import 'package:cv_project/presentation/widgets/import_all.dart';

import 'home.dart';

class OnBoard extends StatefulWidget {
  const OnBoard({super.key});

  @override
  State<OnBoard> createState() => _OnBoardState();
}

class _OnBoardState extends State<OnBoard> {
  PageController controller = PageController(
    initialPage: 0,
    keepPage: false,
  );
  int page = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Directionality(
        textDirection: TextDirection.ltr,
        child: BottomBarBubble(
          height: MediaQuery.of(context).padding.bottom + 70,
          color: primary2Color,
          selectedIndex: page,
          items: [
            BottomBarItem(
                iconBuilder: (color) => Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset('assets/images/home.png',
                            color: color, height: 30, width: 30),
                        TextApp(
                          text: "Home",
                          color: color,
                        )
                      ],
                    )),


            BottomBarItem(
                iconBuilder: (color) => Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset('assets/images/profile.png',
                            color: color, height: 30, width: 30),
                        TextApp(
                          text: "Profile",
                          color: color,
                        )
                      ],
                    )),
          ],
          onSelect: (index) {
            // implement your select function here
            setState(() {
              page = index;
              setState(() {});
            });
          },
        ),
      ),
      body: buildColumn(
        page,
      ),
    );
  }

  Widget buildColumn(int page) {
    switch (page) {
      case 0:
        return const Home();
      case 1:
        return const EditProfile();
      // case 2:
      //   return const History();
      // case 3:
      //   return const Articles(); //MyCardPage(loginEntity: loginEntity);
      // case 4:
      //   return const Profile(); //SettingPage();

      default:
        return Container();
    }
  }
}
