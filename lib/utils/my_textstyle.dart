import 'package:burncheck/utils/my_constant.dart';
import 'package:flutter/material.dart';

class MyTextstyle {
  static String fontFamily = 'Kanit';

  TextAlign textAlignCenter() => TextAlign.center;

  static TextStyle defaultBodyText() => TextStyle(
    fontSize: 14,
    fontFamily: fontFamily,
    color: MyConstant.textBlack,
  );

  // ===== Header ======
  // ~~~~~ H1 ~~~~~~~~~~
  static TextStyle h1Black() => TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w700,
    fontFamily: fontFamily,
    color: MyConstant.textBlack,
  );
  static TextStyle h1White() => TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w700,
    fontFamily: fontFamily,
    color: MyConstant.textWhite,
  );
  static TextStyle h1lightGrey() => TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w700,
    fontFamily: fontFamily,
    color: MyConstant.textLightGrey,
  );
  static TextStyle h1DarkGrey() => TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w700,
    fontFamily: fontFamily,
    color: MyConstant.textDarkGrey,
  );
  static TextStyle h1Red() => TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w700,
    fontFamily: fontFamily,
    color: MyConstant.textRed,
  );

  // ~~~~~ H2 ~~~~~~~~~~
  static TextStyle h2Black() => TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    fontFamily: fontFamily,
    color: MyConstant.textBlack,
  );
  static TextStyle h2White() => TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    fontFamily: fontFamily,
    color: MyConstant.textWhite,
  );
  static TextStyle h2lightGrey() => TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    fontFamily: fontFamily,
    color: MyConstant.textLightGrey,
  );
  static TextStyle h2DarkGrey() => TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    fontFamily: fontFamily,
    color: MyConstant.textDarkGrey,
  );
  static TextStyle h2Red() => TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    fontFamily: fontFamily,
    color: MyConstant.textRed,
  );

  // ~~~~~ H3 ~~~~~~~~~~
  static TextStyle h3Black() => TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    fontFamily: fontFamily,
    color: MyConstant.textBlack,
  );
  static TextStyle h3White() => TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    fontFamily: fontFamily,
    color: MyConstant.textWhite,
  );
  static TextStyle h3lightGrey() => TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    fontFamily: fontFamily,
    color: MyConstant.textLightGrey,
  );
  static TextStyle h3DarkGrey() => TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    fontFamily: fontFamily,
    color: MyConstant.textDarkGrey,
  );
  static TextStyle h3Red() => TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    fontFamily: fontFamily,
    color: MyConstant.textRed,
  );

  // ~~~~~ b1 ~~~~~~~~~~
  static TextStyle b1Black() => TextStyle(
    fontSize: 10,
    fontFamily: fontFamily,
    color: MyConstant.textBlack,
  );
  static TextStyle b1White() => TextStyle(
    fontSize: 10,
    fontFamily: fontFamily,
    color: MyConstant.textWhite,
  );
  static TextStyle b1lightGrey() => TextStyle(
    fontSize: 10,
    fontFamily: fontFamily,
    color: MyConstant.textLightGrey,
  );
  static TextStyle b1DarkGrey() => TextStyle(
    fontSize: 10,
    fontFamily: fontFamily,
    color: MyConstant.textDarkGrey,
  );
  static TextStyle b1Red() => TextStyle(
    fontSize: 10,
    fontFamily: fontFamily,
    color: MyConstant.textRed,
  );

  // ~~~~~ b2 ~~~~~~~~~~
  static TextStyle b2Black() => TextStyle(
    fontSize: 10,
    fontFamily: fontFamily,
    color: MyConstant.textBlack,
  );
  static TextStyle b2White() => TextStyle(
    fontSize: 10,
    fontFamily: fontFamily,
    color: MyConstant.textWhite,
  );
  static TextStyle b2lightGrey() => TextStyle(
    fontSize: 10,
    fontFamily: fontFamily,
    color: MyConstant.textLightGrey,
  );
  static TextStyle b2DarkGrey() => TextStyle(
    fontSize: 10,
    fontFamily: fontFamily,
    color: MyConstant.textDarkGrey,
  );
  static TextStyle b2Red() => TextStyle(
    fontSize: 10,
    fontFamily: fontFamily,
    color: MyConstant.textRed,
  );

  // ===== Loading ======
  static TextStyle loading() => TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w600,
    fontFamily: fontFamily,
  );

  // ===== Credit ======
  static TextStyle powered() => TextStyle(
    fontSize: 10,
    color: MyConstant.textBlack,
    fontFamily: fontFamily,
  );
}
