import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../View/Pages/Home/Home.dart';
import '../../View/Pages/Home/NewsScr.dart';
import '../../View/Pages/Home/Settings.dart';

part 'home_cupit_state.dart';

class HomeCupitCubit extends Cubit<HomeCupitState> {
  HomeCupitCubit() : super(HomeCupitInitial());

  static HomeCupitCubit get(BuildContext context) => BlocProvider.of(context);

  int selectedIndex = 0;

  List<String> AppBarTitles = ["Digital Center", "News", "Settings"];

  void ChangeBotomNavIndex({int index = 0}) {
    selectedIndex = index;
    emit(ChangeBotomNavIndexState());
  }

  List<Widget> HomeScreens = [
    Home(),
    NewsScr(),
    SettingScr(),
  ];



  
}
