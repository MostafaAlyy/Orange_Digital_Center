import 'package:calendar_view/calendar_view.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:orangeflutertraing/Core/Resorses/ColorsManger.dart';

class EventsScr extends StatelessWidget {
  @override
  String title;
  EventsScr({
    required this.title,
  });
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: ColorManger.mainColor,
        centerTitle: true,
        title: Text('$title',
            style: GoogleFonts.acme(fontSize: 20, color: Colors.black)),
        backgroundColor: Colors.white,
        actions: [
          Icon(
            Icons.more_vert_rounded,
            size: 35,
          )
        ],
      ),
      body: MonthView(
        
      ),
    );
  }
}
