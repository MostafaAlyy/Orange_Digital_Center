import 'package:calendar_view/calendar_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:orangeflutertraing/ViewModel/AuthCupit/AuthCupit.dart';
import 'package:orangeflutertraing/ViewModel/NewsCupit/news_cubit.dart';
import 'package:orangeflutertraing/ViewModel/network/local/sharedPreferns.dart';
import 'package:orangeflutertraing/ViewModel/network/remote/dio_helper.dart';

import 'View/Pages/SplashScr.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DioHelper.init();
  await CashHelper.init();

  String? token = CashHelper.getData(key: 'token');
  return runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      lazy: true,
      create: (context) => AuthCupit(),
      child: CalendarControllerProvider(
          controller: EventController(),
          child: MaterialApp(
            title: 'ODC Project',
            debugShowCheckedModeBanner: false,
            home: SplachScr(),
          )),
    );
  }
}
