import 'package:orangeflutertraing/Core/Resorses/ColorsManger.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:orangeflutertraing/View/Pages/Auth/Login_Scr.dart';
import 'package:orangeflutertraing/View/Pages/HomeScr.dart';
import 'package:orangeflutertraing/ViewModel/AuthCupit/states.dart';
import 'package:orangeflutertraing/ViewModel/AuthCupit/AuthCupit.dart';
import 'package:orangeflutertraing/ViewModel/network/local/sharedPreferns.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class SplachScr extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCupit, ODCStates>(
        listener: ((context, state) {}),
        builder: (context, state) {
          var cupit = AuthCupit.get(context);
          return Scaffold(
            body: Container(
              height: double.infinity,
              width: double.infinity,
              child: Padding(
                padding: EdgeInsets.all(40),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
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
                      SizedBox(
                        height: 30,
                      ),
                      LinearPercentIndicator(
                        width: 330,
                        animation: true,
                        lineHeight: 10.0,
                        animationDuration: 2500,
                        percent: 1,
                        linearStrokeCap: LinearStrokeCap.roundAll,
                        progressColor: ColorManger.mainColor,
                        barRadius: Radius.circular(16),
                        onAnimationEnd: () {
                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    (CashHelper.getData(key: 'token') != null)
                                        ? MyHomePage()
                                        : LoginScr()),
                            (Route<dynamic> route) => false,
                          );
                        },
                      ),
                    ]),
              ),
            ),
          );
        });
  }
}
