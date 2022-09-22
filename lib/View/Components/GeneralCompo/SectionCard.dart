import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget SectionCard(
  var context, {
  required String title,
  required String timeTaken,
  required String stime,
  required String etime,
  required String Date,
}) {
  return Container(
    height: 100,
    width: 400,
    child: Card(
      elevation: 16,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(children: [
          Row(
            children: [
              Text("$title",
                  style: GoogleFonts.acme(fontSize: 26, color: Colors.black)),
              Spacer(),
              Icon(Icons.alarm),
              Text("$timeTaken",
                  style: GoogleFonts.roboto(fontSize: 18, color: Colors.black))
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Text(
                    'Sections Day',
                    style: Theme.of(context)
                        .textTheme
                        .caption!
                        .copyWith(fontSize: 14),
                  ),
                  Row(
                    children: [Icon(Icons.calendar_month), Text("$Date")],
                  )
                ],
              ),
              Column(
                children: [
                  Text(
                    'Start Time',
                    style: Theme.of(context)
                        .textTheme
                        .caption!
                        .copyWith(fontSize: 14),
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.access_time_filled,
                        color: Colors.green,
                      ),
                      Text("$stime")
                    ],
                  )
                ],
              ),
              Column(
                children: [
                  Text(
                    'End Time',
                    style: Theme.of(context)
                        .textTheme
                        .caption!
                        .copyWith(fontSize: 14),
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.access_time_filled,
                        color: Colors.red,
                      ),
                      Text("$etime")
                    ],
                  )
                ],
              )
            ],
          )
        ]),
      ),
    ),
  );
}
