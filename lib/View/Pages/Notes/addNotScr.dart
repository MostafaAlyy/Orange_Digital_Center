import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:orangeflutertraing/View/Components/NotesCompo/inputFormField.dart';

class AddNoteScr extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        foregroundColor: Colors.black,
        centerTitle: true,
        title: Text('Add Note',
            style: GoogleFonts.acme(fontSize: 26, color: Colors.black)),
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(children: [
            AddNotesFormFeild(label: "Title"),
            SizedBox(
              height: 20,
            ),
            AddNotesFormFeild(label: "Date"),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 2, color: Colors.greenAccent),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(16),
                      bottomRight: Radius.circular(16),
                    )),
                contentPadding:
                    EdgeInsets.symmetric(vertical: 80, horizontal: 170),
                border: const OutlineInputBorder(
                    borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16),
                  bottomRight: Radius.circular(16),
                )),
                labelText: "Note",
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Center(
              child: Container(
                width: 100,
                child: MaterialButton(
                    height: 40,
                    color: Color.fromARGB(255, 75, 118, 140),
                    onPressed: () {},
                    child: Row(
                      children: [Icon(Icons.add), Text('Add')],
                    )),
              ),
            )
          ]),
        ),
      ),
    );
  }
}
