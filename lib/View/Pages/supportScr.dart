import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:orangeflutertraing/Core/Resorses/ColorsManger.dart';

import 'Auth/SignUp.dart';

class SupportScr extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.orangeAccent,
        centerTitle: true,
        title: Text('Support',
            style: GoogleFonts.acme(fontSize: 24, color: Colors.black)),
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(14.0),
          child: Column(children: [
            TextFormField(
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
                labelText: "Name",
              ),
            ),
            SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
                labelText: "E-Mail",
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              width: double.infinity,
              height: 250,
              child: TextFormField(
                autofocus: false,
                keyboardType: TextInputType.multiline,
                decoration: InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 80, horizontal: 80),
                  hintText: 'Email',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                  labelText: "What is making you unhappy?",
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            MaterialButton(
                color: ColorManger.mainColor,
                height: 40,
                minWidth: double.infinity,
                onPressed: () {},
                child: const Text(
                  'Submit ',
                  style: TextStyle(
                      fontSize: 28,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                )),
            SizedBox(
              height: 10,
            ),
          ]),
        ),
      ),
    );
  }
}
