import 'package:flutter/material.dart';
import 'package:burncheck/utils/my_textstyle.dart';

class ShowText extends StatelessWidget {
  final String title;
  final TextStyle? textStyle;
  final TextAlign? textAlign;
  final TextOverflow? textOverflow;
  final int? maxLines;

  const ShowText({
    super.key,
    required this.title,
    this.textStyle,
    this.textAlign,
    this.textOverflow,
    this.maxLines,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: textStyle ?? MyTextstyle.defaultBodyText(),
      textAlign: textAlign ?? TextAlign.left,
      maxLines: maxLines ?? 2,
      overflow: textOverflow ?? TextOverflow.visible,
    );
  }
}
