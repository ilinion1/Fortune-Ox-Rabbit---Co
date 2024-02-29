import 'package:flutter/material.dart';
import 'package:fortune/FYFYJYsourceFHYF/SAEFcommonASFEA/ZSFEconstsZFSE/DTapp_imagesNDF.dart';

class ASEFBackgroundImageAEFAS extends StatelessWidget {
  const ASEFBackgroundImageAEFAS({
    super.key,
    required this.child,
    this.image = SGRAppImagesSTW4W.backgroundSGS,
  });

  final String image;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(image),
          fit: BoxFit.cover,
        ),
      ),
      child: child,
    );
  }
}
