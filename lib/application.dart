import 'package:aaaaaaaaaaaaaaa/screens/auth/auth_screen.dart';
import 'package:aaaaaaaaaaaaaaa/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Application extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        accentColor: AppColors.RED,
        textTheme: Theme.of(context).textTheme.copyWith(
          body1: Theme.of(context).textTheme.body1.copyWith(color: AppColors.TEXT)
        ),
        backgroundColor: AppColors.BACKGROUND_COLOR,
      ),
      home: AuthScreen(),
    );
  }

}