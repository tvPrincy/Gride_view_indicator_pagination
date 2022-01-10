import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class AllNotifier extends ChangeNotifier {
  List<String> listImageUrl0 = [
    "https://picsum.photos/id/0/5616/3744",
    "https://picsum.photos/id/0/5616/3744",
    "https://picsum.photos/id/0/5616/3744",
    "https://picsum.photos/id/0/5616/3744",
    "https://picsum.photos/id/1002/4312/2868",
    "https://picsum.photos/id/1002/4312/2868",
    "https://picsum.photos/id/1002/4312/2868",
    "https://picsum.photos/id/1002/4312/2868",
    "https://picsum.photos/id/0/5616/3744",
    "https://picsum.photos/id/0/5616/3744",
    "https://picsum.photos/id/0/5616/3744",
    "https://picsum.photos/id/0/5616/3744",
    "https://picsum.photos/id/1002/4312/2868",
    "https://picsum.photos/id/1002/4312/2868",
    "https://picsum.photos/id/1002/4312/2868",
    "https://picsum.photos/id/1002/4312/2868",
  ];
  List<String> listImageUrl1 = [
    "https://picsum.photos/id/0/5616/3744",
    "https://picsum.photos/id/1002/4312/2868",
    "https://picsum.photos/id/1002/4312/2868",
    "https://picsum.photos/id/0/5616/3744",
    "https://picsum.photos/id/1002/4312/2868",
  ];
  List<String> listImageUrl2 = [
    "https://picsum.photos/id/0/5616/3744",
    "https://picsum.photos/id/0/5616/3744",
    "https://picsum.photos/id/0/5616/3744",
    "https://picsum.photos/id/1002/4312/2868",
    "https://picsum.photos/id/1002/4312/2868",
    "https://picsum.photos/id/1002/4312/2868",
  ];
  bool isImgLoading = false;
  bool hasMoreImageData = true;
  int imgGetLimit = 15;
  int currentPageIndex = 0;
}

class TextStyleTheme {
  static Text customText(String text,double size,Color color,FontWeight fontWeight){
    return Text(
      text,
      style: TextStyle(
          color: color,
          fontSize: size,
          fontWeight: fontWeight),
    );
  }
}

class ImageNetwork extends StatelessWidget {
  String imgUrl;
  Color progressColor;
  ImageNetwork({
    Key? key,
    required this.imgUrl,
    required this.progressColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
        fit: BoxFit.cover,
        imageUrl: imgUrl,
        progressIndicatorBuilder: (context, url, downloadProgress) => Center(
            child: Center(
              child: Lottie.asset("assets/raw/loading_running.json"),
            ) /*CircularProgressIndicator(
                value: downloadProgress.progress,
                color: progressColor,
              ),*/
        ),
        errorWidget: (context, url, error) {
          print(error);
          return const Icon(
            Icons.error,
            size: 100,
            color: Colors.red,
          );
        });
  }
}
