import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tech/shared/cubit/app_cubit.dart';
import 'package:tech/shared/cubit/app_states.dart';

class CategoryScreen extends StatelessWidget {
  var search = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit,AppStates>(
      listener: (context,state){},
      builder: (context,state){
        return  Center(
          child: Text('CategoryScreen',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30)),
        );
      },
    );
  }
}

