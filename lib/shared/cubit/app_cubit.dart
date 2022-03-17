import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tech/models/banner_model.dart';
import 'package:tech/models/category_model.dart';
import 'package:tech/models/product_model.dart';
import 'package:tech/models/user_model.dart';
import 'package:tech/screens/category_screen/category_screen.dart';
import 'package:tech/screens/favorite_screen/favorite_screen.dart';
import 'package:tech/screens/home_screen/home_screen.dart';
import 'package:tech/screens/settings_screen/setting_screen.dart';
import 'package:tech/shared/styles/icon_broken.dart';
import 'app_states.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitialState());

  static AppCubit get(context) => BlocProvider.of(context);

  UserModel userdata;
   Stream getUserData(String uId){
     FirebaseFirestore.instance.collection('users').doc(uId).get().then((value) {
      userdata= UserModel.fromJson(value.data());
      currentIndex=0;
      emit(GetUserSuccessState());
    }).catchError((err){
      emit(GetUserErrorState());

    });
  }


  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
    emit(UserSingOutSuccessState());
  }

  int currentIndex = 0;
  List<IconData> listOfIcons = [
    IconBroken.Home,
    IconBroken.Heart,
    IconBroken.Category,
    IconBroken.Setting,
  ];

  List<Widget> screens = [
    HomeScreen(),
    FavoriteScreen(),
    CategoryScreen(),
    SettingScreen(),
  ];

  void changeBottomNav(int index) {
    currentIndex = index;
    emit(ChangeBottomNavState());
  }

  List<CategoryModel> category=[];
  void getCategory({
  String token,
}) {
    emit(GetCategoryLoadingState());
    FirebaseFirestore.instance.collection('category').get().then((value) {
      value.docs.forEach((element) {
        category.add(CategoryModel.fromJson(element.data()));
        print(category[0].name);
      });
      emit(GetCategorySuccessState());
    }).catchError((error){
      emit(GetCategoryErrorState());
      print(error.toString());
    });
  }

  List<ProductModel> product=[];
  void getproduct( {
    String token,
  }) {
    emit(GetCategoryLoadingState());
    FirebaseFirestore.instance.collection('product').get().then((value) {
      value.docs.forEach((element) {
        product.add(ProductModel.fromJson(element.data()));
      });
      emit(GetProductSuccessState());
    }).catchError((error){
      emit(GetProductErrorState());
      print(error.toString());
    });
  }

  List<BannerModel> banner=[];
  void getBanner({
    String token,
  }) {
    emit(GetBannerLoadingState());
    FirebaseFirestore.instance.collection('banners').get().then((value) {
      value.docs.forEach((element) {
        banner.add(BannerModel.fromJson(element.data()));
      });
      emit(GetBannerSuccessState());
    }).catchError((error){
      emit(GetBannerErrorState());
      print(error.toString());
    });
  }
  List <ProductModel> catproduct=[];

}

