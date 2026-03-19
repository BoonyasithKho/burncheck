import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ShowSVG extends StatelessWidget {
  const ShowSVG({
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

    return SvgPicture.asset(
      pathFile,
      width: assetWidth ?? defaultSize,
      height: assetHeight ?? defaultSize,
    );
  }
}
