import 'package:burncheck/utils/my_constant.dart';
import 'package:burncheck/utils/my_textstyle.dart';
import 'package:burncheck/widgets/show_text.dart';
import 'package:flutter/material.dart';

class ShowDialog {
  static void showInformationItem(
    BuildContext context,
    Size size,
    String titleDialog,
    String contentDialog,
    double heightContent,
  ) {
    showDialog(
      context: context,
      builder: (_) => Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24.0),
        ),
        child: Container(
          padding: EdgeInsets.all(16.0),
          width: size.width,
          height: heightContent,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24.0),
            color: MyConstant.bgWhite,
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: ShowText(
                      title: titleDialog,
                      textStyle: MyTextstyle.h2Black(),
                      textOverflow: TextOverflow.visible,
                    ),
                  ),
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.grey, width: 1.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(Icons.close),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: ShowText(
                  title: contentDialog,
                  textStyle: MyTextstyle.b2Black(),
                  maxLines: 1000,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
