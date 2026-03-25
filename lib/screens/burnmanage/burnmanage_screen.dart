import 'package:burncheck/screens/burnmanage/burnmanage_component/addrequest_component.dart';
import 'package:burncheck/utils/my_asset.dart';
import 'package:burncheck/utils/my_constant.dart';
import 'package:burncheck/utils/my_textstyle.dart';
import 'package:burncheck/widgets/show_header.dart';
import 'package:burncheck/widgets/show_image.dart';
import 'package:burncheck/widgets/show_svg.dart';
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
          color: MyConstant.bgWhite,
          border: Border.all(color: MyConstant.border),
          borderRadius: BorderRadius.circular(16.0),
          boxShadow: [
            BoxShadow(color: MyConstant.border, offset: const Offset(0, -3)),
          ],
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
      child: SizedBox(
        width: size.width * 0.94,
        height: 192,
        child: Stack(
          children: [
            ShowImage(
              pathFile: MyAsset.pm25Verybad,
              assetWidth: size.width,
              assetHeight: 192,
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Stack(
                        children: [
                          Center(
                            child: ShowText(
                              title: 'ดัชนีคุณภาพอากาศรายชั่วโมง',
                              textStyle: MyTextstyle.h3WhiteBoldShadows(),
                            ),
                          ),
                          SizedBox(
                            width: 176,
                            height: 136,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Container(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 16.0,
                                    vertical: 6.0,
                                  ),
                                  decoration: BoxDecoration(
                                    color: Colors.red,
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  child: ShowText(title: 'คุณภาพอากาศดีมาก'),
                                ),
                                ShowText(
                                  title: 'ข้อมูลอ้างอิงจาก : เช็คฝุ่น GISTDA',
                                  textStyle: MyTextstyle.b1White(),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: SizedBox(
                              width: 176,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  ShowText(
                                    title: '75',
                                    textStyle: TextStyle(
                                      fontFamily: MyTextstyle.fontFamily,
                                      fontSize: 64,
                                      fontWeight: FontWeight.bold,
                                      color: MyConstant.textWhite,
                                      shadows: [
                                        Shadow(
                                          blurRadius: 10.0,
                                          color: MyConstant.textDarkGrey,
                                          offset: Offset(0.5, 1.0),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 4.0,
                          vertical: 2.0,
                        ),
                        decoration: BoxDecoration(
                          color: MyConstant.bgDarkGrey.withAlpha(64),
                          borderRadius: BorderRadius.circular(4.0),
                        ),
                        child: ShowText(
                          // title: '${now.year}-${now.month}-${now.day}',
                          title: '13 มีนาคม 2026 เวลา 02:14 น.',
                          textStyle: MyTextstyle.dateShowWhite(),
                          textAlign: TextAlign.end,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        children: [
                          ShowImage(
                            pathFile: MyAsset.weatherIcon,
                            assetHeight: 24,
                          ),
                          ShowText(title: '1${MyConstant.unitTemperature}'),
                        ],
                      ),
                      Row(
                        children: [
                          ShowSVG(pathFile: MyAsset.waterIcon, assetHeight: 24),
                          ShowText(title: ' 2%'),
                        ],
                      ),
                      Row(
                        children: [
                          ShowSVG(pathFile: MyAsset.windIcon, assetHeight: 16),
                          ShowText(title: ' 3 กม./ชม.'),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            // ShowText(title: '104', textStyle: MyTextstyle.h1Black()),
            // Column(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: [
            //     ShowText(title: 'ต่ำ', textStyle: MyTextstyle.b2Black()),
            //     ShowText(
            //       title: 'ดัชนีคุณภาพอากาศ',
            //       textStyle: MyTextstyle.b2Black(),
            //     ),
            //   ],
            // ),
          ],
        ),
      ),
    );
  }
}
