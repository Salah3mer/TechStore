import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tech/screens/register_screen/cubit/register_states.dart';

class RegsiterCubit extends Cubit<RegisterStates>{

  RegsiterCubit ():super(RegisterInitState());
  static  RegsiterCubit get(context)=>BlocProvider.of(context);

  bool isPassword =true;
  IconData  suffix=Icons.remove_red_eye_outlined;

  void changeEye(){
    isPassword =!isPassword;
    suffix = isPassword ? Icons.remove_red_eye_outlined:Icons.visibility_off_outlined ;
    emit(ChangeEyeState());

  }

  void userInfo(@required name,
      @required email,
      @required pass,
      @required phone,
      )
  {
    emit(RegisterLoadingState());
    FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: pass).then((value) {
    emit(RegisterSuccessState());
    }).catchError((error){
      email(RegisterErrorState(error.toString()));
      print(error);
    });
  }

}