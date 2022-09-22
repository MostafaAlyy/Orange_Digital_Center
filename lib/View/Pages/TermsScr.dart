import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:orangeflutertraing/Core/Resorses/ColorsManger.dart';
import 'package:orangeflutertraing/ViewModel/SettingsCupit/settings_cubit.dart';
import 'package:flutter_html/flutter_html.dart';

import 'Auth/SignUp.dart';

class TermsScr extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SettingsCubit()..getTerms(),
      child: BlocConsumer<SettingsCubit, SettingsState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          var cupit = SettingsCubit.get(context);

          return Scaffold(
              appBar: AppBar(
                foregroundColor: Colors.orangeAccent,
                centerTitle: true,
                title: Text('Terms of Condition',
                    style: GoogleFonts.acme(fontSize: 24, color: Colors.black)),
                backgroundColor: Colors.white,
              ),
              body: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                    width: double.infinity,
                    height: 500,
                    child: ConditionalBuilder(
                        condition: (cupit.terms != null),
                        builder: (context) => Html(
                              data: "${cupit.terms!.data!.terms}",
                            ),
                        fallback: (context) => Center(
                              child: CircularProgressIndicator(
                                color: ColorManger.mainColor,
                              ),
                            ))),
              ));
        },
      ),
    );
  }
}
