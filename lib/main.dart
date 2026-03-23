import 'package:burncheck/bloc/mainpage/mainpage_bloc.dart';
import 'package:burncheck/bloc/market/market_bloc.dart';
import 'package:burncheck/bloc/profilesetting/profilesetting_bloc.dart';
import 'package:burncheck/screens/app.dart';
import 'package:burncheck/screens/splash/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final mainPageBloc = BlocProvider(create: (context) => MainpageBloc());
  final marketBloc = BlocProvider(create: (context) => MarketBloc());
  final profileSettingBloc = BlocProvider(
    create: (context) => ProfilesettingBloc(),
  );

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [mainPageBloc, marketBloc, profileSettingBloc],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SplashScreen(nextPage: const MainShell()),
      ),
    );
  }
}
