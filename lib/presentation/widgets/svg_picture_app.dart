
import 'import_all.dart';

class SvgPictureApp extends StatelessWidget {

  const SvgPictureApp({super.key, required this.height, required this.width, required this.boxFit, required this.photo, this.color});
  final double height;
  final double width;
  final BoxFit boxFit;
  final String photo;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(photo,height: height,width: width,fit: boxFit,color: color,);
  }
}
