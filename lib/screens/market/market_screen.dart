import 'package:burncheck/utils/my_constant.dart';
import 'package:burncheck/widgets/show_header.dart';
import 'package:flutter/material.dart';

class MarketScreen extends StatefulWidget {
  const MarketScreen({super.key});

  @override
  State<MarketScreen> createState() => _MarketScreenState();
}

class _MarketScreenState extends State<MarketScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: MyConstant.bgLightGrey2,
      child: Column(
        children: [
          ShowHeader(),
          Center(child: Text('data')),
        ],
      ),
    );
  }
}
