import 'package:burncheck/utils/my_constant.dart';
import 'package:burncheck/utils/my_textstyle.dart';
import 'package:burncheck/widgets/show_text.dart';
import 'package:flutter/material.dart';

class AddNews extends StatelessWidget {
  const AddNews({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 16.0,
      right: 16.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          GestureDetector(
            onTap: () {
              debugPrint('ลงประกาศ');
            },
            child: Container(
              width: 136,
              height: 40,
              decoration: BoxDecoration(
                color: MyConstant.textRed,
                borderRadius: BorderRadius.circular(40.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    offset: const Offset(0, 4),
                    blurRadius: 4,
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.add, color: Colors.white, size: 16),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ShowText(
                      title: 'ลงประกาศ',
                      textStyle: MyTextstyle.b2White(),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
