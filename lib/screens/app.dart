import 'package:burncheck/bloc/mainpage/mainpage_bloc.dart';
import 'package:burncheck/screens/burnmanage/burnmanage_screen.dart';
import 'package:burncheck/screens/home/home_screen.dart';
import 'package:burncheck/screens/market/market_screen.dart';
import 'package:burncheck/screens/noti/notification_screen.dart';
import 'package:burncheck/screens/profilesetting/profilesetting_screen.dart';
import 'package:burncheck/utils/my_constant.dart';
import 'package:burncheck/widgets/show_bottomnavigationbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainShell extends StatefulWidget {
  const MainShell({super.key});

  @override
  State<MainShell> createState() => _MainShellState();
}

class _MainShellState extends State<MainShell> {
  @override
  void initState() {
    super.initState();
    context.read<MainpageBloc>().add(
      MainpageEventGetPM25(userPosition: [14, 100]),
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final List<Widget> pages = [
      HomeScreen(),
      MarketScreen(),
      BurnmanageScreen(),
      NotificationScreen(),
      ProfilesettingScreen(),
    ];

    return BlocBuilder<MainpageBloc, MainpageState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: MyConstant.bgWhite,
          body: SafeArea(
            child: IndexedStack(index: state.screenSelect, children: pages),
          ),
          bottomNavigationBar: ShowBottomNavigationBar(size: size),
        );
      },
    );
  }
}
