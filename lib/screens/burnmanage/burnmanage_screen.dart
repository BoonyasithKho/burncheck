import 'package:burncheck/utils/my_constant.dart';
import 'package:burncheck/widgets/show_header.dart';
import 'package:flutter/material.dart';

class BurnmanageScreen extends StatefulWidget {
  const BurnmanageScreen({super.key});

  @override
  State<BurnmanageScreen> createState() => _BurnmanageScreenState();
}

class _BurnmanageScreenState extends State<BurnmanageScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: MyConstant.bgLightGrey2,
      child: Column(children: [ShowHeader()]),
    );
  }
}
