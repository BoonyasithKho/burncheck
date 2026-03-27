import 'package:burncheck/bloc/mainpage/mainpage_bloc.dart';
import 'package:burncheck/screens/burnmanage/burnmanage_component/addrequest_component.dart';
import 'package:burncheck/screens/burnmanage/burnmanage_component/menuresult_component.dart';
import 'package:burncheck/utils/my_asset.dart';
import 'package:burncheck/utils/my_constant.dart';
import 'package:burncheck/utils/my_textstyle.dart';
import 'package:burncheck/widgets/show_header.dart';
import 'package:burncheck/widgets/show_image.dart';
import 'package:burncheck/widgets/show_svg.dart';
import 'package:burncheck/widgets/show_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
      height: size.height,
      color: MyConstant.bgLightGrey2,
      child: Stack(
        children: [
          Column(
            children: [
              ShowHeader(),
              Expanded(
                child: SingleChildScrollView(
                  child: BlocBuilder<MainpageBloc, MainpageState>(
                    builder: (context, state) {
                      return Column(
                        children: [
                          menuSelectZone(size),
                          airQualityZone(size, state),
                          forecastAirQualityZone(),
                        ],
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
          AddRequest(),
        ],
      ),
    );
  }

  Padding forecastAirQualityZone() {
    return Padding(
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
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) =>
              MenuResultComponent(titleContent: title, index: index),
        ),
      ),
      child: Container(
        width: (size.width * 0.9) / 2,
        height: 116,
        decoration: BoxDecoration(
          color: MyConstant.bgWhite,
          border: Border.all(color: MyConstant.border),
          borderRadius: BorderRadius.circular(16.0),
          boxShadow: [
            BoxShadow(color: MyConstant.border, offset: const Offset(0, -3)),
            BoxShadow(color: MyConstant.border, blurRadius: 1),
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

  Padding airQualityZone(Size size, MainpageState state) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: SizedBox(
        width: size.width * 0.94,
        height: size.width * 0.48,
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.0),
                boxShadow: [
                  BoxShadow(
                    color: MyConstant.border,
                    blurRadius: 3,
                    offset: Offset(0, -0.5),
                  ),
                ],
              ),
              child: ShowImage(
                pathFile: MyConstant.iconPM[state.pmSituation]['iconBG'],
                assetWidth: size.width,
                assetHeight: size.width * 0.48,
              ),
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
                              textStyle: MyConstant
                                  .iconPM[state.pmSituation]['textStyleShow'],
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
                                    vertical: 4.0,
                                  ),
                                  decoration: BoxDecoration(
                                    color: MyConstant
                                        .iconPM[state.pmSituation]['colorGain'],
                                    borderRadius: BorderRadius.circular(8.0),
                                    boxShadow: [
                                      BoxShadow(
                                        color: MyConstant.textDarkGrey,
                                        blurRadius: 2,
                                        offset: Offset(0, 2),
                                      ),
                                    ],
                                  ),
                                  child: ShowText(
                                    title:
                                        MyConstant.iconPM[state
                                            .pmSituation]['description'],
                                    textStyle:
                                        MyConstant.iconPM[state
                                            .pmSituation]['pmValueColor'],
                                  ),
                                ),
                                SizedBox(height: 4),
                                ShowText(
                                  title: 'ข้อมูลอ้างอิงจาก : เช็คฝุ่น GISTDA',
                                  textStyle:
                                      MyConstant.iconPM[state
                                          .pmSituation]['textStyleB1Show'],
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
                                  state.pmStatus == PmStatus.initial
                                      ? Padding(
                                          padding: const EdgeInsets.only(
                                            top: 24.0,
                                          ),
                                          child: CircularProgressIndicator(
                                            color: MyConstant.marketRed,
                                          ),
                                        )
                                      : ShowText(
                                          title: state.pm25Value.toString(),
                                          textStyle: TextStyle(
                                            fontFamily: MyTextstyle.fontFamily,
                                            fontSize: 64,
                                            fontWeight: FontWeight.bold,
                                            color: MyConstant.textWhite,
                                            shadows: [
                                              Shadow(
                                                blurRadius: 10.0,
                                                color: MyConstant.textDarkGrey,
                                                offset: Offset(0, 2.0),
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
                          title: state.pm25Update,
                          textStyle: MyConstant
                              .iconPM[state.pmSituation]["textDateShow"],
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
                          ShowText(
                            title:
                                '${state.tempValue}${MyConstant.unitTemperature}',
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          ShowImage(
                            pathFile: MyAsset.waterIcon,
                            assetHeight: 24,
                          ),
                          ShowText(title: ' 2%'),
                        ],
                      ),
                      Row(
                        children: [
                          ShowSVG(pathFile: MyAsset.windIcon, assetHeight: 16),
                          ShowText(title: ' ${state.windSpeed} กม./ชม.'),
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
