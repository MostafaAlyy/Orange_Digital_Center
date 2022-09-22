import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:orangeflutertraing/View/Components/settingCompo/SettingRow.dart';
import 'package:orangeflutertraing/View/Pages/Auth/Login_Scr.dart';
import 'package:orangeflutertraing/View/Pages/supportScr.dart';
import 'package:orangeflutertraing/ViewModel/SettingsCupit/settings_cubit.dart';

class SettingScr extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SettingsCubit(),
      child: BlocConsumer<SettingsCubit, SettingsState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          var cupit = SettingsCubit.get(context);

          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(children: [
                SettingRow(
                    label: "FAQ", screen: SupportScr(), context: context),
                SizedBox(
                  height: 16,
                ),
                Container(
                  height: 1,
                  width: double.infinity,
                  color: Colors.grey,
                ),
                SizedBox(
                  height: 16,
                ),
                SettingRow(
                    label: "Terms & Conditions",
                    screen: SupportScr(),
                    context: context),
                SizedBox(
                  height: 16,
                ),
                Container(
                  height: 1,
                  width: double.infinity,
                  color: Colors.grey,
                ),
                SizedBox(
                  height: 16,
                ),
                SettingRow(
                    label: "Our Partners",
                    screen: SupportScr(),
                    context: context),
                SizedBox(
                  height: 16,
                ),
                Container(
                  height: 1,
                  width: double.infinity,
                  color: Colors.grey,
                ),
                SizedBox(
                  height: 16,
                ),
                SettingRow(
                    label: "Support", screen: SupportScr(), context: context),
                SizedBox(
                  height: 16,
                ),
                Container(
                  height: 1,
                  width: double.infinity,
                  color: Colors.grey,
                ),
                SizedBox(
                  height: 16,
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => LoginScr()));
                    cupit.LogOut();
                  },
                  child: Row(
                    children: [
                      Text("Log out",
                          style: GoogleFonts.roboto(
                              fontSize: 20, color: Colors.black)),
                      Spacer(),
                      Icon(
                        Icons.navigate_next_outlined,
                        size: 35,
                        color: Colors.grey,
                      )
                    ],
                  ),
                ),
              ]),
            ),
          );
        },
      ),
    );
  }
}
