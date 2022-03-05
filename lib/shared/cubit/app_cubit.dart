import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tech/screens/category_screen/category_screen.dart';
import 'package:tech/screens/favorite_screen/favorite_screen.dart';
import 'package:tech/screens/home_screen/home_screen.dart';
import 'package:tech/screens/setting_screen/setting_screen.dart';
import 'package:tech/shared/styles/icon_broken.dart';
import 'app_states.dart';

class AppCubit extends Cubit<AppStates>{
  AppCubit() : super(AppInitialState());

  static AppCubit get(context) => BlocProvider.of(context);

  int currentIndex =0;
  List<IconData> listOfIcons = [
    IconBroken.Home,
    IconBroken.Heart,
    IconBroken.Category,
    IconBroken.Setting,
  ];

  List<Widget>screens=[
    HomeScreen(),
    FavoriteScreen(),
    CategoryScreen(),
    SettingScreen(),
  ];
  void changeBottomNav(int index){
    currentIndex=index;
    emit(ChangeBottomNavState());
  }
}