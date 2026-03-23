import 'package:burncheck/utils/my_constant.dart';
import 'package:burncheck/utils/my_textstyle.dart';
import 'package:burncheck/widgets/show_text.dart';
import 'package:flutter/material.dart';

class DistanceSlider extends StatelessWidget {
  const DistanceSlider({
    super.key,
    required this.valueKm,
    required this.onChangedKm,
  });

  final int valueKm;
  final ValueChanged<int> onChangedKm;

  @override
  Widget build(BuildContext context) {
    final int maxKm = 1000;

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
                  activeTickMarkColor: MyConstant.textRed,
                  inactiveTickMarkColor: MyConstant.textRed,
                  valueIndicatorColor: MyConstant.textRed,
                  valueIndicatorTextStyle: MyTextstyle.b2White(),
                  thumbColor: MyConstant.textRed,
                ),
                child: Slider(
                  value: valueKm.toDouble(),
                  min: 0,
                  max: maxKm.toDouble(),
                  divisions: 100,
                  label: '$valueKm กม.',
                  onChanged: (v) => onChangedKm(v.round()),
                ),
              ),
              ShowText(title: '$valueKm กม.', textStyle: MyTextstyle.b2Black()),
            ],
          ),
        ),
        showScroreMinMax('1,000'),
      ],
    );
  }

  Padding showScroreMinMax(String title) {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0),
      child: ShowText(title: title, textStyle: MyTextstyle.b2DarkGrey()),
    );
  }
}
