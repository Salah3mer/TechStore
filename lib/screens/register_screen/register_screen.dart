import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tech/screens/register_screen/cubit/register_cubit.dart';
import 'package:tech/screens/register_screen/cubit/register_states.dart';
import 'package:tech/shared/components/components.dart';

class RegisterScreen extends StatelessWidget {
  var formKey = GlobalKey<FormState>();
  var name = TextEditingController();
  var email = TextEditingController();
  var pass = TextEditingController();
  var phone = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegsiterCubit(),
      child: BlocConsumer<RegsiterCubit, RegisterStates>(
        listener: (context, state) {
          if (state is RegisterSuccessState) {
            toast(text: 'SignUp Sucess', state: FlutterToastState.success);
          } else if (state is RegisterErrorState) {
            toast(text: state.error, state: FlutterToastState.error);
          }
        },
        builder: (context, state) {
          var c = RegsiterCubit.get(context);
          return Scaffold(
            backgroundColor: Colors.white,
            body: SafeArea(
              child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 2,
                      child: Container(
                        alignment: AlignmentDirectional.bottomStart,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/images/register.png'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text('Register Now ',
                                style: TextStyle(
                                    fontSize: 30, fontWeight: FontWeight.bold)),
                            SizedBox(
                              height: 5,
                            ),
                            Text('To get Our Hot Products',
                                style: TextStyle(fontSize: 20)),
                          ],
                        )),
                    Expanded(
                        flex: 3,
                        child: Container(
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(30),
                              topRight: Radius.circular(30),
                            ),
                          ),
                          child: SingleChildScrollView(
                            physics: const BouncingScrollPhysics(),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                myFormField(
                                    controller: name,
                                    label: 'Name',
                                    type: TextInputType.name,
                                    prefix: Icons.person,
                                    validate: (String val) {
                                      if (val.isEmpty) {
                                        return 'Name can\'t  be Empty';
                                      }
                                    }),
                                myFormField(
                                    controller: email,
                                    label: 'Email',
                                    type: TextInputType.emailAddress,
                                    prefix: Icons.email,
                                    validate: (String val) {
                                      if (val.isEmpty) {
                                        return 'Email can\'t  be Empty';
                                      }
                                    }),
                                myFormField(
                                    controller: pass,
                                    label: 'Password',
                                    onChange: (val) {
                                      print(val.toString());
                                    },
                                    type: TextInputType.visiblePassword,
                                    prefix: Icons.password,
                                    isPassword: c.isPassword,
                                    suffix: c.suffix,
                                    suffixOnPressed: () {
                                      c.changeEye();
                                    },
                                    validate: (String val) {
                                      if (val.length < 6) {
                                        return 'can\'t be less than 6';
                                      }
                                    }),
                                myFormField(
                                    controller: phone,
                                    label: 'Phone',
                                    type: TextInputType.phone,
                                    prefix: Icons.phone,
                                    validate: (String val) {
                                      if (val.length < 11) {
                                        return 'phone can\'t be less than 11';
                                      }
                                    }),
                                const SizedBox(
                                  height: 5,
                                ),
                                defaultButton(
                                    text: 'SignUp',
                                    function: () {
                                      if (formKey.currentState.validate()) {
                                        c.userInfo(name.text, email.text,
                                            pass.text, phone.text);
                                        if (state is RegisterSuccessState) {
                                          name.text = '';
                                          email.text = '';
                                          pass.text = '';
                                          phone.text = '';
                                        }
                                      }
                                    }),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Text('Already Have An Account ?'),
                                    TextButton(
                                        onPressed: () {},
                                        child: const Text('Login Now',
                                            style:
                                                TextStyle(color: Colors.blue)))
                                  ],
                                ),
                              ],
                            ),
                          ),
                        )),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
