import 'package:flutter/material.dart';

class ShowImage extends StatelessWidget {
  const ShowImage({
    super.key,
    required this.pathFile,
    this.assetWidth,
    this.assetHeight,
  });

  final String pathFile;
  final double? assetWidth;
  final double? assetHeight;

  @override
  Widget build(BuildContext context) {
    double defaultSize = 48.0;

    return Image.asset(
      pathFile,
      width: assetWidth ?? defaultSize,
      height: assetHeight ?? defaultSize,
    );
  }
}
