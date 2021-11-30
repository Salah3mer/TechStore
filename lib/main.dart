import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tech/screens/splash_screen/splash_screen.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.cyan,
        statusBarBrightness: Brightness.dark,
        systemNavigationBarColor:Colors.cyan,
        systemNavigationBarContrastEnforced: true,
        statusBarIconBrightness: Brightness.dark,
      ));

  runApp( MyApp());
}

class MyApp extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.cyan,
      ),
      home: SplashScreen(),
    );
  }
}


