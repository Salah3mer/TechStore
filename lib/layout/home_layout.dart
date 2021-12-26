import 'package:flutter/material.dart';
import 'package:tech/screens/login_screen/login_screen.dart';
import 'package:tech/shared/cash_helper.dart';
import 'package:tech/shared/components/components.dart';
import 'package:tech/shared/styles/icon_broken.dart';

class HomeLayout extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
           body:Center(
             child: TextButton(
               onPressed: (){
                 CashHelper.removeData(key: 'uId');
                 navegatToAndFinsh(context, LoginScreen());
               },
               child: Text('logOut'),
             ),
           )
    );
  }
}
