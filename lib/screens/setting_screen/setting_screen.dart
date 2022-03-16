import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tech/screens/login_screen/login_screen.dart';
import 'package:tech/shared/cash_helper.dart';
import 'package:tech/shared/components/components.dart';
import 'package:tech/shared/components/const.dart';
import 'package:tech/shared/cubit/app_cubit.dart';
import 'package:tech/shared/cubit/app_states.dart';

class SettingScreen extends StatelessWidget {
  var search = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit,AppStates>(
      listener: (context,state){},
      builder: (context,state){
      var  c=AppCubit.get(context);
        return  Center(
          child: TextButton(
            onPressed: () {
              navegatToAndFinsh(context, LoginScreen()).then((value) {
                c.signOut();
                CashHelper.removeData(key: uId);
              });
        },
        child: Text('logOut'),
        )
        );
      },
    );
  }
}

