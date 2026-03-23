import 'package:burncheck/utils/my_asset.dart';
import 'package:burncheck/utils/my_constant.dart';
import 'package:burncheck/utils/my_textstyle.dart';
import 'package:burncheck/widgets/show_header.dart';
import 'package:burncheck/widgets/show_text.dart';
import 'package:flutter/material.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  late int numberNoti = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: MyConstant.bgLightGrey2,
      child: Column(children: [ShowHeader(), notifyContent()]),
    );
  }

  Expanded notifyContent() {
    return Expanded(
      child: Container(
        padding: EdgeInsets.only(top: 16.0, left: 16.0, right: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ShowText(
              title: 'จำนวนทั้งหมด $numberNoti รายการ',
              textStyle: MyTextstyle.b2Black(),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.only(top: 8.0),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 32.0, bottom: 8.0),
                      child: SizedBox(
                        width: 40,
                        child: Image.asset(MyAsset.logoApp),
                      ),
                    ),
                    ShowText(
                      title: 'ไม่มีข้อมูล',
                      textStyle: MyTextstyle.b2DarkGrey(),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
