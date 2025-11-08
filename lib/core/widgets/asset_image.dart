import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppAssetImage extends StatelessWidget {
  final String imagePath;
  final double? width;
  final double? height;
  final BoxFit? fit;
  const AppAssetImage({super.key, required this.imagePath, this.width, this.height, this.fit});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(imagePath, width: width, height: height, fit: fit ?? BoxFit.contain);
  }
}
