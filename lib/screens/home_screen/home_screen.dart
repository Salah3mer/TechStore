import 'package:carousel_slider/carousel_slider.dart';
import 'package:conditional_builder/conditional_builder.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tech/models/category_model.dart';
import 'package:tech/models/user_model.dart';
import 'package:tech/screens/search_screen/search_screen.dart';
import 'package:tech/shared/components/components.dart';
import 'package:tech/shared/components/const.dart';
import 'package:tech/shared/cubit/app_cubit.dart';
import 'package:tech/shared/cubit/app_states.dart';
import 'package:tech/shared/styles/icon_broken.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: AppCubit.get(context).getUserData(FirebaseAuth.instance.currentUser.uid),
      builder:(context,index)=> BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {
        },
        builder: (context, state) {
          var c = AppCubit.get(context);
          Widget category(
            CategoryModel model,
          ) =>
              Container(
                width: 170,
                height: 60,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(.06),
                      blurRadius: 20,
                      offset: const Offset(0, 5),
                    ),
                  ],
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Row(
                    children: [
                      Container(
                        width: 40,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                          image: NetworkImage(model.urlImage),
                          fit: BoxFit.fitHeight,
                        )),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: Text(
                          model.name,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
          return ConditionalBuilder(
            condition: state is GetUserSuccessState,
            builder: (context)=>Padding(
              padding: const EdgeInsets.all(15.0),
              child: SafeArea(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Row(
                          children: [
                            CircleAvatar(
                              backgroundImage: NetworkImage(
                                  c.userdata.image),
                              radius: 30,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              'Hi ${c.userdata.name} !',
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
                          decoration: BoxDecoration(
                              boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(.06),
                              blurRadius: 20,
                              offset: const Offset(0, 5),
                            ),
                          ]),
                          child: myFormField(
                              label: 'Search',
                              readonly: true,
                              onTap:(){
                                navegatTo(context, SearchScreen());
                              } ,
                              prefix: IconBroken.Search,
                              myColor: Colors.white)),
                      const SizedBox(
                        height: 15,
                      ),
                      CarouselSlider.builder(
                          itemCount: c.banner.length,
                          itemBuilder: (context, index, ind) => Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(30),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(.06),
                                    blurRadius: 20,
                                    offset: const Offset(0, 5),
                                  ),
                                ],
                                image: DecorationImage(
                                    image: NetworkImage(c.banner[index].urlImage),
                                    fit: BoxFit.fill)),
                          ),
                          options: CarouselOptions(
                            autoPlay: true,
                            enlargeCenterPage: true,
                            disableCenter: true,
                            aspectRatio: 2.0,
                          )),
                      const SizedBox(
                        height: 15,
                      ),
                      const Text(
                        'Categories',
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        height: 60,
                        width: double.infinity,
                        child: ListView.separated(
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) => InkWell(
                                onTap: () {},
                                highlightColor: Colors.lightBlue,
                                child: category(
                                  c.category[index],
                                )),
                            separatorBuilder: (context, index) => const SizedBox(
                              width: 15,
                            ),
                            itemCount: c.category.length),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            fallback: (context)=> Center(child: CircularProgressIndicator()),
          );
        },
      ),
    );
  }
}
