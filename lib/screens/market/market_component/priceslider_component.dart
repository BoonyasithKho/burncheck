import 'package:burncheck/utils/my_constant.dart';
import 'package:burncheck/utils/my_textstyle.dart';
import 'package:burncheck/widgets/show_text.dart';
import 'package:flutter/material.dart';

class RangeKmSlider extends StatelessWidget {
  final RangeValues valuePrice;
  final dynamic onChangedPriceRange;

  const RangeKmSlider({
    super.key,
    required this.valuePrice,
    required this.onChangedPriceRange,
  });

  @override
  Widget build(BuildContext context) {
    final double min = 0;
    final double max = 1000;
    final double step = 50;
    final divisions = ((max - min) / step).round();

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,

      children: [
        showScroreMinMax('0'),
        Expanded(
          child: Column(
            children: [
              SliderTheme(
                data: SliderTheme.of(context).copyWith(
                  trackHeight: 3,
                  activeTrackColor: MyConstant.textRed,
                  inactiveTrackColor: MyConstant.textDarkGrey,
                  showValueIndicator: ShowValueIndicator.onDrag,
                  overlayColor: MyConstant.textRed,
                  valueIndicatorColor: MyConstant.textRed,
                  valueIndicatorTextStyle: MyTextstyle.b2White(),
                  thumbColor: MyConstant.textRed,
                ),
                child: RangeSlider(
                  min: min,
                  max: max,
                  divisions: divisions,
                  values: valuePrice,
                  onChanged: onChangedPriceRange,
                ),
              ),
              // Text(),
              Center(
                child: ShowText(
                  title:
                      '${valuePrice.start.toInt()} - ${valuePrice.end.toInt()} บาท',
                  textStyle: MyTextstyle.b2Black(),
                ),
              ),
            ],
          ),
        ),
        showScroreMinMax('1,000'),
      ],
    );
  }

  Padding showScroreMinMax(String title) {
    return Padding(
      padding: EdgeInsets.only(top: 16.0),
      child: ShowText(title: title, textStyle: MyTextstyle.b2DarkGrey()),
    );
  }
}
