import 'package:burncheck/utils/my_constant.dart';
import 'package:burncheck/utils/my_textstyle.dart';
import 'package:burncheck/widgets/show_text.dart';
import 'package:flutter/material.dart';

class BoxMenuComponent extends StatelessWidget {
  const BoxMenuComponent({
    super.key,
    required this.order,
    required this.size,
    required this.icon,
    required this.textButton,
    required this.description,
  });

  final Size size;
  final int order;
  final IconData icon;
  final String textButton;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0),
      child: Container(
        width: (size.width * 0.9) / 2,
        decoration: BoxDecoration(
          border: Border.all(color: MyConstant.marketRed, width: 2),
          color: MyConstant.bgWhite,
          borderRadius: BorderRadius.circular(8.0),
        ),
        height: 176,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            CircleAvatar(
              radius: 32,
              backgroundColor: MyConstant.bgLightGrey2,
              child: Icon(icon, size: 32, color: MyConstant.textRed),
            ),
            Container(
              padding: EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ShowText(title: textButton, textStyle: MyTextstyle.h3Red()),
                  ShowText(
                    title: description,
                    textStyle: MyTextstyle.b1DarkGrey(),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: InkWell(
                onTap: () => debugPrint(textButton),
                child: Container(
                  decoration: BoxDecoration(
                    color: MyConstant.bgRed,
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                  width: size.width,
                  height: 24,
                  child: Center(
                    child: ShowText(
                      title: 'จัดการเลย',
                      textStyle: MyTextstyle.b2White(),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
