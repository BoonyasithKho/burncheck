import 'package:burncheck/utils/my_textstyle.dart';
import 'package:flutter/material.dart';

class ShowText extends StatelessWidget {
  final String title;
  final TextStyle? textStyle;
  final TextAlign? textAlign;
  final TextOverflow? textOverflow;
  final int? maxLines;
  final String? label;

  const ShowText({
    super.key,
    required this.title,
    this.textStyle,
    this.textAlign,
    this.textOverflow,
    this.maxLines,
    this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: textStyle ?? MyTextstyle.defaultBodyText(),
      textAlign: textAlign ?? TextAlign.left,
      maxLines: maxLines ?? 2,
      overflow: textOverflow ?? TextOverflow.visible,
      semanticsLabel: label,
    );
  }
}
