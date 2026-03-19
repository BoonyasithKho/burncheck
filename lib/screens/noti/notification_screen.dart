import 'package:burncheck/utils/my_constant.dart';
import 'package:burncheck/widgets/show_header.dart';
import 'package:flutter/material.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
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
