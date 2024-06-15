
import 'import_all.dart';

class NoHaveData extends StatelessWidget {
  const NoHaveData({super.key});

  @override
  Widget build(BuildContext context) {
    return  const Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextApp(
         text: "لا يوجد بيانات حاليا",
          maxLines: 3,
          fontWeight: FontWeight.w700,
          textAlign: TextAlign.center,
          fontSize: 17,
          color: Colors.black,
        ),
      ],
    );
  }
}
