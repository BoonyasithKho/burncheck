import 'package:burncheck/screens/home/home_component/boxmenu_component.dart';
import 'package:burncheck/screens/home/home_component/price_component.dart';
import 'package:burncheck/utils/my_asset.dart';
import 'package:burncheck/utils/my_constant.dart';
import 'package:burncheck/utils/my_textstyle.dart';
import 'package:burncheck/widgets/show_header.dart';
import 'package:burncheck/widgets/show_image.dart';
import 'package:burncheck/widgets/show_text.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      color: MyConstant.bgLightGrey2,
      child: Column(
        children: [
          ShowHeader(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              BoxMenuComponent(
                size: size,
                order: 1,
                icon: Icons.storefront_outlined,
                textButton: 'ซื้อขายเศษซากวัสดุเกษตร',
                description: 'ระบบตลาดกลางซื้อขาย\nเศษซากวัสดุทางการเกษตร',
              ),
              BoxMenuComponent(
                size: size,
                order: 2,
                icon: Icons.fireplace_outlined,
                textButton: 'บริหารจัดการเผาในที่โล่ง',
                description: 'ระบบบริหารจัดการเชื้อเพลิง\nในพื้นที่โล่ง',
              ),
            ],
          ),
          PriceComponent(),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: ShowImage(
              pathFile: MyAsset.logoOrganize,
              assetWidth: size.width * 0.5,
              assetHeight: 32,
            ),
          ),
          ShowText(
            title:
                'พัฒนาโดย สำนักงานพัฒนาเทคโนโลยีอวกาศและภูมิสารสนเทศ\n(องค์การมหาชน):GISTDA',
            textAlign: TextAlign.center,
            textStyle: MyTextstyle.powered(),
          ),
          SizedBox(height: 8.0),
        ],
      ),
    );
  }
}
