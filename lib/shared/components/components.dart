import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hexcolor/hexcolor.dart';

import '../cash_helper.dart';

void navegatTo(context, widget) =>
    Navigator.push(context, MaterialPageRoute(builder: (context) => widget));

Future navegatToAndFinsh(context, widget) =>
    Navigator.pushAndRemoveUntil(
        context, MaterialPageRoute(builder: (context) => widget), (route) {
      return false;
    });

void navegatBack(context, widget) =>
    Navigator.pop(context, MaterialPageRoute(builder: (context) => widget));

Widget myFormField({@required TextEditingController controller,

  String label,
  String hint,
  Function validate,
  Function onTap,
  Function onChange,
  Function onSubmit,
  Function suffixOnPressed,
  TextInputType type,
  IconData prefix,
  IconData suffix,
  TextStyle style,
  int maxleanth,
  bool autofocus = false,
  Color myColor,
  bool readonly = false,
  bool isPassword = false,}) =>
    Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
      child: TextFormField(
        readOnly: readonly,
        controller: controller,
        validator: validate,
        onTap: onTap,
        keyboardType: type,
        obscureText: isPassword,
        onFieldSubmitted: onSubmit,
        onChanged: onChange,
        style: style,
        autofocus:autofocus,
        maxLength: maxleanth,
        decoration: InputDecoration(

          hintStyle: const TextStyle(fontWeight: FontWeight.normal),
          fillColor: myColor != null ? myColor : Colors.grey[100],
          filled: true,
          labelText: label,
          hintText: hint,
          prefixIcon: Icon(
            prefix,
          ),
          suffixIcon: suffix != null
              ? IconButton(
            onPressed: suffixOnPressed,
            icon: Icon(suffix),
          )
              : null,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(
              color: HexColor('#008db8'),
            ),
          ),

        ),
      ),
    );

Widget defaultButton({String text, Function function}) =>
    Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Container(
        width: double.infinity,
        height: 60,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                HexColor('01add4'),
                HexColor('01add4'),
                HexColor('01add4'),
                HexColor('01a4cd'),
                HexColor('0197c2'),
                HexColor('0194bf'),
                HexColor('0193be'),
                HexColor('0193be'),
              ]),
        ),
        child: MaterialButton(
          onPressed: function,
          child: Text(
            text,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          minWidth: double.infinity,
        ),
      ),
    );

void toast({
  @required String text,
  @required FlutterToastState state,
}) =>
    Fluttertoast.showToast(
        msg: text,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 5,
        backgroundColor: choseColor(state),
        textColor: Colors.white,
        fontSize: 16.0);
enum FlutterToastState { success, warning, error }

Color choseColor(FlutterToastState state) {
  Color color;
  switch (state) {
    case FlutterToastState.success:
      color = Colors.green;
      break;
    case FlutterToastState.warning:
      color = Colors.amber;
      break;
    case FlutterToastState.error:
      color = Colors.red;
      break;
  }
  return color;
}

