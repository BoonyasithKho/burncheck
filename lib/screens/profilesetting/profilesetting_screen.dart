import 'package:burncheck/utils/my_constant.dart';
import 'package:burncheck/widgets/show_header.dart';
import 'package:flutter/material.dart';

class ProfilesettingScreen extends StatefulWidget {
  const ProfilesettingScreen({super.key});

  @override
  State<ProfilesettingScreen> createState() => _ProfilesettingScreenState();
}

class _ProfilesettingScreenState extends State<ProfilesettingScreen> {
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
