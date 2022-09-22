
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:orangeflutertraing/View/Components/Home/HomeCard.dart';
import 'package:orangeflutertraing/View/Components/NewsCompo/CardCompo.dart';
import 'package:orangeflutertraing/View/Pages/Home/EventsScr.dart';
import 'package:orangeflutertraing/View/Pages/Sections_Scr.dart';

import '../Auth/SignUp.dart';
import '../Notes/NotesScr.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(14.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  HomeCard(
                      context: context,
                      label: "Lectures",
                      icon: Icons.menu_book_sharp,
                      screen: SectionsScr(
                        title: "Lectures",
                      )),
                  HomeCard(
                      context: context,
                      label: "Sections",
                      icon: Icons.people_rounded,
                      screen: SectionsScr(
                        title: "Sections",
                      ))
                ],
              ),
              Row(
                children: [
                  HomeCard(
                      context: context,
                      label: "Midterms",
                      icon: Icons.find_in_page,
                      screen: SectionsScr(
                        title: "Midterms",
                      )),
                  HomeCard(
                      context: context,
                      label: "Finals",
                      icon: Icons.insert_page_break_rounded,
                      screen: SectionsScr(
                        title: "Finals",
                      ))
                ],
              ),
              Row(
                children: [
                  HomeCard(
                      context: context,
                      label: "Events",
                      icon: Icons.calendar_month,
                      screen: EventsScr(
                        title: "Events",
                      )),
                  HomeCard(
                      context: context,
                      label: "Notes",
                      icon: Icons.edit,
                      screen: NotesScr()),
                ],
              ),
            ],
          ),
        ));
  }
}
