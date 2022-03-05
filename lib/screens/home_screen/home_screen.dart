import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tech/shared/components/components.dart';
import 'package:tech/shared/cubit/app_cubit.dart';
import 'package:tech/shared/cubit/app_states.dart';
import 'package:tech/shared/styles/icon_broken.dart';

class HomeScreen extends StatelessWidget {
  var search = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit,AppStates>(
      listener: (Context,state){},
      builder: (context,state){
        return  Padding(
          padding: const EdgeInsets.all(15.0),
          child: SafeArea(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Row(
                    children: [
                      CircleAvatar(
                        backgroundImage: NetworkImage(
                            'https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg'),
                        radius: 30,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        'Hi Salah !',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      const Spacer(),
                      Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(.06),
                                  blurRadius: 20,
                                  offset: const Offset(0, 5),
                                ),
                              ]),
                          child: IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                IconBroken.Buy,
                                size: 30,
                                color: Colors.blueGrey,
                              )))
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                    decoration: BoxDecoration(boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(.06),
                        blurRadius: 20,
                        offset: const Offset(0, 5),
                      ),
                    ]),
                    child: myFormField(
                        controller: search,
                        label: 'Search',
                        prefix: IconBroken.Search,
                        myColor: Colors.white)),
              ],
            ),
          ),
        );
      },
    );
  }
}
