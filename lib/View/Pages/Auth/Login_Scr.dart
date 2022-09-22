// ignore_for_file: unrelated_type_equality_checks

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:orangeflutertraing/Core/Resorses/ColorsManger.dart';
import 'package:orangeflutertraing/View/Pages/HomeScr.dart';
import 'package:orangeflutertraing/ViewModel/AuthCupit/states.dart';
import 'package:orangeflutertraing/ViewModel/AuthCupit/AuthCupit.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import '../../Components/AuthCompo/textFormField.dart';
import 'SignUp.dart';

class LoginScr extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCupit, ODCStates>(
      listener: (context, state) {
        if (state is ODCILoginSucsessState) {
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => MyHomePage()),
            (Route<dynamic> route) => false,
          );

          showTopSnackBar(
            context,
            CustomSnackBar.success(
              message: "${state.message}",
            ),
          );
        } else if (state is ODCILoginEroreState) {
          showTopSnackBar(
            context,
            CustomSnackBar.error(
              message: '${state.message}',
            ),
          );
        }
      },
      builder: (context, state) {
        var cupit = AuthCupit.get(context);

        return Scaffold(
            body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              SizedBox(
                height: 20,
              ),
              Container(
                width: double.infinity,
                child: Center(
                  child: Row(
                    children: [
                      SizedBox(
                        width: 35,
                      ),
                      Text(
                        'Orange ',
                        style: TextStyle(
                            fontSize: 28,
                            color: ColorManger.mainColor,
                            fontWeight: FontWeight.bold),
                      ),
                      Text("Digital Center",
                          style: TextStyle(
                              fontSize: 28,
                              color: Colors.black,
                              fontWeight: FontWeight.bold))
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 70,
              ),
              Text('Login',
                  style: TextStyle(
                      fontSize: 28,
                      color: Colors.black,
                      fontWeight: FontWeight.bold)),
              SizedBox(
                height: 20,
              ),
              defultTextInputFeild(
                  label: "E-Mail", controller: cupit.emailController),
              SizedBox(
                height: 20,
              ),
              defultTextInputFeild(
                  isPassowrdShown: cupit.isPassowrdShown,
                  label: "Password",
                  sufixx: IconButton(
                      onPressed: () {
                        cupit.ShowPass();
                      },
                      icon: (cupit.isPassowrdShown)
                          ? Icon(
                              Icons.remove_red_eye,
                              color: ColorManger.mainColor,
                            )
                          : Icon(
                              Icons.visibility_off,
                              color: ColorManger.mainColor,
                            )),
                  controller: cupit.passController),
              SizedBox(
                height: 10,
              ),
              Text(
                "Forget Password?",
                style: TextStyle(color: ColorManger.mainColor),
              ),
              SizedBox(
                height: 30,
              ),
              MaterialButton(
                  color: ColorManger.mainColor,
                  height: 40,
                  minWidth: double.infinity,
                  onPressed: () {
                    cupit.Login();
                  },
                  child: Text(
                    'Login ',
                    style: TextStyle(
                        fontSize: 28,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  )),
              SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 2,
                    width: 120,
                    color: Colors.grey,
                  ),
                  Text("OR",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      )),
                  Container(
                    height: 2,
                    width: 120,
                    color: Colors.grey,
                  ),
                ],
              ),
              SizedBox(height: 15),
              Container(
                width: double.infinity,
                height: 40,
                child: Container(
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                        side:
                            BorderSide(color: ColorManger.mainColor, width: 2),
                        surfaceTintColor: ColorManger.mainColor),
                    child: Text('Sign Up',
                        style: TextStyle(
                            fontSize: 28,
                            color: ColorManger.mainColor,
                            fontWeight: FontWeight.bold)),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => SignUpScr()));
                    },
                  ),
                ),
              )
            ]),
          ),
        ));
      },
    );
  }
}
