import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:orangeflutertraing/View/Pages/Auth/Login_Scr.dart';
import 'package:orangeflutertraing/ViewModel/AuthCupit/states.dart';
import 'package:orangeflutertraing/ViewModel/AuthCupit/AuthCupit.dart';
import 'package:orangeflutertraing/Core/Resorses/ColorsManger.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import '../../Components/AuthCompo/textFormField.dart';
import '../HomeScr.dart';

class SignUpScr extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCupit, ODCStates>(
      listener: (context, state) {
        // TODO: implement listener
        if (state is ODCIRegsterSucsessState) {
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => LoginScr()),
            (Route<dynamic> route) => false,
          );

          showTopSnackBar(
            context,
            CustomSnackBar.success(
              message: "${state.message}",
            ),
          );
        } else if (state is ODCIRegsterEroreState) {
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
                        width: 30,
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
              Text('Sign Up',
                  style: TextStyle(
                      fontSize: 28,
                      color: Colors.black,
                      fontWeight: FontWeight.bold)),
              SizedBox(
                height: 15,
              ),
              defultTextInputFeild(
                  label: "Name", controller: cupit.RegsterNameController),
              SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 10,
              ),
              defultTextInputFeild(
                  label: "E-Mail", controller: cupit.RegsteremailController),
              SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 10,
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
                  controller: cupit.RegsterpassController),
              SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 10,
              ),
              defultTextInputFeild(
                  isPassowrdShown: cupit.isPassowrdShown,
                  label: "Confirm Password",
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
                  controller: cupit.RegsterConfirmpassController),
              SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 10,
              ),
              defultTextInputFeild(
                  label: "Phone Number",
                  controller: cupit.RegsterPhoneController),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 35,
                  ),
                  Column(
                    children: [
                      Text(
                        'Gender',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      Container(
                        width: 90,
                        height: 50,
                        decoration: BoxDecoration(
                            border: Border.all(color: ColorManger.mainColor),
                            borderRadius: BorderRadius.circular(14)),
                        child: Center(
                          child: DropdownButton<String>(
                            value: cupit.SelectedGender,
                            icon: const Icon(Icons.arrow_downward),
                            elevation: 16,
                            underline: Container(
                              height: 2,
                            ),
                            items:
                                cupit.GenderList.map<DropdownMenuItem<String>>(
                                    (String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                            onChanged: (String? value) {
                              // This is called when the user selects an item.
                              print(value.toString());
                              if (value.toString() == value.toString())
                                cupit.Gender = 'f';
                              else
                                cupit.Gender = 'm';

                              cupit.changeGender(value.toString());
                            },
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    width: 90,
                  ),
                  Column(
                    children: [
                      Text(
                        'University',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      Container(
                        width: 90,
                        height: 50,
                        decoration: BoxDecoration(
                            border: Border.all(color: ColorManger.mainColor),
                            borderRadius: BorderRadius.circular(14)),
                        child: Center(
                          child: DropdownButton<String>(
                            value: cupit.UniversityList.first.toString(),
                            icon: const Icon(Icons.arrow_downward),
                            elevation: 16,
                            underline: Container(
                              height: 2,
                            ),
                            items: cupit.UniversityList.map<
                                DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                            onChanged: (String? value) {
                              // This is called when the user selects an item.
                            },
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
              Center(
                child: Column(
                  children: [
                    Text(
                      'Grade',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    Container(
                      width: 90,
                      height: 50,
                      decoration: BoxDecoration(
                          border: Border.all(color: ColorManger.mainColor),
                          borderRadius: BorderRadius.circular(14)),
                      child: Center(
                        child: DropdownButton<String>(
                          value: cupit.GradeList.first,
                          icon: const Icon(Icons.arrow_downward),
                          elevation: 16,
                          underline: Container(
                            height: 2,
                          ),
                          items: cupit.GradeList.map<DropdownMenuItem<String>>(
                              (String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          onChanged: (String? value) {
                            // This is called when the user selects an item.
                          },
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    MaterialButton(
                        color: ColorManger.mainColor,
                        height: 40,
                        minWidth: double.infinity,
                        onPressed: () {
                          cupit.Regster();
                        },
                        child: Text(
                          'Sign Up ',
                          style: TextStyle(
                              fontSize: 28,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        )),
                    SizedBox(
                      height: 10,
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
                    SizedBox(height: 10),
                    Container(
                      width: double.infinity,
                      height: 40,
                      child: Container(
                        child: OutlinedButton(
                          style: OutlinedButton.styleFrom(
                              side: BorderSide(
                                  color: ColorManger.mainColor, width: 2),
                              surfaceTintColor: ColorManger.mainColor),
                          child: Text('Log in',
                              style: TextStyle(
                                  fontSize: 28,
                                  color: ColorManger.mainColor,
                                  fontWeight: FontWeight.bold)),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => LoginScr()));
                          },
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ]),
          ),
        ));
      },
    );
  }
}
