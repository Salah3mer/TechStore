import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tech/models/product_model.dart';
import 'package:tech/screens/category_screen/category_screen.dart';
import 'package:tech/screens/login_screen/login_screen.dart';
import 'package:tech/shared/cash_helper.dart';
import 'package:tech/shared/components/components.dart';
import 'package:tech/shared/components/const.dart';
import 'package:tech/shared/cubit/app_cubit.dart';
import 'package:tech/shared/cubit/app_states.dart';
import 'package:tech/shared/styles/icon_broken.dart';

class SingleCategoryScreen extends StatelessWidget {
  var search = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit,AppStates>(
      listener: (context,state){

      },
      builder: (context,state){
        var  c=AppCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.grey.shade50,
            elevation: 0,
            leading: IconButton(color: Colors.blueGrey,
              onPressed: (){
              navegatBack(context, CategoryScreen());
              },
              icon:Icon( IconBroken.Arrow___Left_Circle,
              color: Colors.blueGrey,
              )
            ),
          ),
          body: Container(
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: GridView.count(
                crossAxisCount: 2,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                children: List.generate(
                  c.catproduct.length,
                      (index) => homeGrid(c.catproduct[index]),
                ),
                crossAxisSpacing: 5,
                mainAxisSpacing: 5,
                childAspectRatio: 1 / 1.5,
              ),
            ),
          )
        );

      },
    );
  }
}

