import 'package:burncheck/utils/my_constant.dart';
import 'package:burncheck/utils/my_textstyle.dart';
import 'package:burncheck/widgets/show_text.dart';
import 'package:flutter/material.dart';

class RadioChip extends StatelessWidget {
  const RadioChip({
    super.key,
    required this.title,
    required this.value,
    required this.selected,
    required this.onTap,
  });

  final String title;
  final int value;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(10),
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 22,
              height: 22,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.black54, width: 2),
              ),
              child: selected
                  ? Center(
                      child: Container(
                        width: 10,
                        height: 10,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: MyConstant.marketRed,
                        ),
                      ),
                    )
                  : null,
            ),
            const SizedBox(width: 10),
            ShowText(title: title, textStyle: MyTextstyle.b2Black()),
          ],
        ),
      ),
    );
  }
}
