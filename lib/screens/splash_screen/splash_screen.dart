import 'dart:async';

import 'package:flutter/material.dart';
import 'package:tech/componets/components.dart';
import 'package:tech/screens/login_screen/login_screen.dart';


class SplashScreen extends StatefulWidget {
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  void initState(){
    super.initState();
    Timer(const Duration(seconds: 3),(){
    navegatToAndFinsh(context, Login_Screen());
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children:  [
              Expanded(
                flex: 1,
                child: Container(
                  height: 240,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image:  AssetImage('assets/images/logo.png'),
                      ),
                    )
                  ),
              ),
              const CircularProgressIndicator(
                 valueColor: AlwaysStoppedAnimation(Colors.cyan),
               ),
           const SizedBox(height: 40,)
          ],
        ),
      ),
    );
  }
}
