import 'package:burncheck/screens/burnmanage/burnmanage_component/addrequest_component.dart';
import 'package:burncheck/utils/my_constant.dart';
import 'package:burncheck/utils/my_textstyle.dart';
import 'package:burncheck/widgets/show_header.dart';
import 'package:burncheck/widgets/show_text.dart';
import 'package:flutter/material.dart';

class BurnmanageScreen extends StatefulWidget {
  const BurnmanageScreen({super.key});

  @override
  State<BurnmanageScreen> createState() => _BurnmanageScreenState();
}

class _BurnmanageScreenState extends State<BurnmanageScreen> {
  late final DateTime now;
  @override
  void initState() {
    super.initState();
    now = DateTime.now();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      color: MyConstant.bgLightGrey2,
      child: Stack(
        children: [
          Column(
            children: [
              ShowHeader(),
              menuSelectZone(size),
              airQualityZone(size),
              forecastAirQualityZone(),
            ],
          ),
          AddRequest(),
        ],
      ),
    );
  }

  Expanded forecastAirQualityZone() {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(12.0, 0.0, 12.0, 16.0),
        child: Container(
          padding: EdgeInsets.only(left: 16.0, right: 16.0, bottom: 16.0),
          decoration: BoxDecoration(
            border: Border.all(color: MyConstant.border),
            color: Colors.white.withAlpha(128),
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ShowText(title: 'พยากรณ์ดัชนีคุณภาพอากาศ 6 วัน'),
              ShowText(
                title:
                    'EGAT,Nontaburu, Thailand (การไฟฟ้าฝ้ายผลิตแห่งประเทศไทย (กฟผ.))',
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 24.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      ShowText(title: 'พ.'),
                      ShowText(title: '176'),
                    ],
                  ),
                  Column(
                    children: [
                      ShowText(title: 'พฤ.'),
                      ShowText(title: '163'),
                    ],
                  ),
                  Column(
                    children: [
                      ShowText(title: 'ศ.'),
                      ShowText(title: '159'),
                    ],
                  ),
                  Column(
                    children: [
                      ShowText(title: 'ส.'),
                      ShowText(title: '137'),
                    ],
                  ),
                  Column(
                    children: [
                      ShowText(title: 'อ.'),
                      ShowText(title: '147'),
                    ],
                  ),
                  Column(
                    children: [
                      ShowText(title: 'จ.'),
                      ShowText(title: '141'),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Padding menuSelectZone(Size size) {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0, left: 8.0, right: 8.0),
      child: Wrap(
        spacing: 16.0,
        runSpacing: 16.0,
        children: [
          menuBurnBtn(size, MyConstant.burnManagementMenuItems[0]['title'], 0),
          menuBurnBtn(size, MyConstant.burnManagementMenuItems[1]['title'], 1),
          menuBurnBtn(size, MyConstant.burnManagementMenuItems[2]['title'], 2),
          menuBurnBtn(size, MyConstant.burnManagementMenuItems[3]['title'], 3),
        ],
      ),
    );
  }

  GestureDetector menuBurnBtn(Size size, String title, int index) {
    return GestureDetector(
      onTap: () => debugPrint(title),
      child: Container(
        width: (size.width * 0.9) / 2,
        height: 116,
        decoration: BoxDecoration(
          color: Colors.white.withAlpha(128),
          border: Border.all(color: MyConstant.border),
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MyConstant.burnManagementMenuItems[index]['icon'],
            Padding(padding: EdgeInsetsGeometry.all(8.0)),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 4.0),
              decoration: BoxDecoration(
                color: MyConstant.bgRed,
                borderRadius: BorderRadius.circular(16.0),
              ),
              child: ShowText(title: title, textStyle: MyTextstyle.h3White()),
            ),
          ],
        ),
      ),
    );
  }

  Padding airQualityZone(Size size) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Container(
        width: size.width * 0.94,
        height: 100,
        decoration: BoxDecoration(
          color: Colors.orange,
          border: Border.all(color: Colors.black),
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ShowText(title: 'วันนี้', textStyle: MyTextstyle.b2Black()),
                ShowText(
                  title: '${now.year}-${now.month}-${now.day}',
                  textStyle: MyTextstyle.b2Black(),
                ),
              ],
            ),
            ShowText(title: '104', textStyle: MyTextstyle.h1Black()),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ShowText(title: 'ต่ำ', textStyle: MyTextstyle.b2Black()),
                ShowText(
                  title: 'ดัชนีคุณภาพอากาศ',
                  textStyle: MyTextstyle.b2Black(),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
