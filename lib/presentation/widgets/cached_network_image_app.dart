import 'package:cached_network_image/cached_network_image.dart';

import 'import_all.dart';

class CachedNetworkImageApp extends StatelessWidget {
  const CachedNetworkImageApp({super.key, required this.height, required this.width, required this.imageUrl, this.errors});

  final double height;
  final double width;
  final String imageUrl;

  final Widget? errors;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      height: height,width: width,
      fit: BoxFit.fill,
      imageUrl:
          imageUrl,
      imageBuilder: (context, imageProvider) {
        // print(imageUrl);
        // print(imageUrl.toLowerCase().endsWith('.svg'));
        // Check if the image is SVG
        if (imageUrl.toLowerCase().endsWith('.svg')) {
          return SvgPicture.network(
            imageUrl,  height: height,width: width,
            placeholderBuilder: (context) => const CircularProgressIndicator(),
          );
        } else {
          // If not SVG, use the regular CachedNetworkImage
          return Image(
            image: imageProvider,
            height: height,width: width,
            fit: BoxFit.fill,
          );
        }
      },
      placeholder: (context, url) =>  Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Image.asset("assets/images/loading-bar.png",color: grayColor,fit: BoxFit.fitWidth,width:width/2,height: width/2)]
        // ),
      ),
        errorWidget: (context, url, error) {
          return errors ?? const Icon(Icons.error);
        }
    );
  }
}
