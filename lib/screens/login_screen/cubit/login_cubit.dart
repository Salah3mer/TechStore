import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tech/shared/styles/icon_broken.dart';
import 'login_state.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit() : super(LoginInitState());

  static LoginCubit get(context) => BlocProvider.of(context);
  bool isPassword = true;
  IconData suffix = IconBroken.Hide;

  void changeLoginEye() {
    isPassword = !isPassword;
    suffix = isPassword ? IconBroken.Hide : IconBroken.Show;
    emit(ChangeLoginEyeState());
  }
  void userLogin({String email, String pass}) {
    emit(LoginLoadingState());
    FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: pass)
        .then((value) {
      emit(LoginSuccessState(value.user.uid));
    }).catchError((error) {
      emit(LoginErrorState(error.toString()));
    });
  }

}