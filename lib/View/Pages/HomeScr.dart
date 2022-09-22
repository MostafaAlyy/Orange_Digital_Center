import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import 'package:orangeflutertraing/Core/Resorses/ColorsManger.dart';
import 'package:orangeflutertraing/ViewModel/HomeCubit/home_cupit_cubit.dart';

import 'Auth/Login_Scr.dart';
import 'Home/NewsScr.dart';

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCupitCubit(),
      child: BlocConsumer<HomeCupitCubit, HomeCupitState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          var cupit = HomeCupitCubit.get(context);

          return Scaffold(
            appBar: AppBar(
              centerTitle: true,
              elevation: 0,
              title: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  if (cupit.selectedIndex == 0)
                    Text(
                      'Orange ',
                      style: GoogleFonts.roboto(
                          fontSize: 24,
                          color: ColorManger.mainColor,
                          fontWeight: FontWeight.bold),
                    ),
                  Text(
                    "${cupit.AppBarTitles[cupit.selectedIndex]}",
                    style: GoogleFonts.roboto(
                        fontSize: 24,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),
              backgroundColor: Colors.white,
            ),
            body: cupit.HomeScreens[cupit.selectedIndex],
            bottomNavigationBar: Padding(
              padding: const EdgeInsets.all(8.0),
              child: GNav(
                  onTabChange: (index) {
                    cupit.ChangeBotomNavIndex(index: index);
                  },
                  haptic: true,
                  selectedIndex: cupit.selectedIndex,
                  tabBorderRadius: 18,
                  curve: Curves.easeInCirc, // tab animation curves
                  duration: Duration(milliseconds: 400),
                  gap: 8, // the tab button gap between icon and text
                  activeColor: ColorManger.mainColor,
                  tabBackgroundColor: Colors.grey[200]!,
                  iconSize: 24,
                  padding: EdgeInsets.symmetric(horizontal: 35, vertical: 12),
                  tabs: [
                    GButton(
                      icon: Icons.home,
                      text: 'Home',
                    ),
                    GButton(
                      icon: Icons.newspaper,
                      text: 'News',
                    ),
                    GButton(
                      icon: Icons.settings,
                      text: 'Setting',
                    ),
                  ]),
            ),
          );
        },
      ),
    );
  }
}
