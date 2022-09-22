import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:orangeflutertraing/View/Pages/Notes/addNotScr.dart';

class NotesScr extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        foregroundColor: Colors.black,
        centerTitle: true,
        title: Text('Notes',
            style: GoogleFonts.acme(fontSize: 26, color: Colors.black)),
        backgroundColor: Colors.white,
      ),
      body: Center(
          child: Container(
        child: Text(
          'There in No Data To Show',
          style: GoogleFonts.roboto(fontSize: 20),
        ),
      )),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color.fromARGB(255, 108, 152, 174),
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => AddNoteScr()));
        },
        child: Icon(
          Icons.add,
          color: Colors.black,
        ),
      ),
    );
  }
}
