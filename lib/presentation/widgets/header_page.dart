import 'import_all.dart';

class HeaderPage extends StatelessWidget {
  const HeaderPage({super.key, required this.titel});

  final String titel;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset("assets/images/healthy.png",height: 22,width: 22,),
        const SizedBox(width: 10,),
        TextApp(
          text: titel,
          textAlign: TextAlign.start,
          fontWeight: FontWeight.w700,
          fontSize: 17,
        )
      ],
    );
  }
}
