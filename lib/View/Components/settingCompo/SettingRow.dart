import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget SettingRow({
  required String label,
  required Widget screen,
  required var context,
  Function? fun,
}) {
  return InkWell(
    onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => screen));

    },
    child: Row(
      children: [
        Text("${label}",
            style: GoogleFonts.roboto(fontSize: 20, color: Colors.black)),
        Spacer(),
        Icon(
          Icons.navigate_next_outlined,
          size: 35,
          color: Colors.grey,
        )
      ],
    ),
  );
}
