import 'package:burncheck/bloc/mainpage/mainpage_bloc.dart';
import 'package:burncheck/screens/app.dart';
import 'package:burncheck/screens/splash/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final marketBloc = BlocProvider(create: (context) => MainpageBloc());

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [marketBloc],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SplashScreen(nextPage: const MainShell()),
      ),
    );
  }
}
