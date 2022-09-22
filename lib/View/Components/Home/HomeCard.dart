

import 'package:flutter/material.dart';

Widget HomeCard({
  required String label,
  required var icon,
  required Widget screen,
  required var context,
}) {
  return InkWell(
    onTap: () {
      Navigator.push(context, MaterialPageRoute(builder: (context) => screen));
    },
    child: Container(
      width: 190,
      height: 150,
      child: Card(
        elevation: 10,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                  maxRadius: 30,
                  backgroundColor: Colors.grey[300],
                  child: Icon(
                    icon,
                    color: Colors.deepOrange,
                    size: 40,
                  )),
              SizedBox(
                height: 8,
              ),
              Text(
                '$label',
                style: TextStyle(
                    fontSize: 18,
                    color: Colors.deepOrange,
                    fontWeight: FontWeight.bold),
              )
            ]),
      ),
    ),
  );
}
