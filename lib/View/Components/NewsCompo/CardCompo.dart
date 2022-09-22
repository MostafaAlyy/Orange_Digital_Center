import 'package:flutter/material.dart';

Widget NewsCardCompo({
  required String image,
  required String title,
  required String body,
}) {
  return Container(
    height: 235,
    width: 400,
    child: Card(
        elevation: 18,
        child: Stack(
          children: [
            Image.network(
              '${image}',
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        '${title}',
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: 24,
                            fontWeight: FontWeight.bold),
                      ),
                      Spacer(),
                      Container(
                        height: 45,
                        width: 100,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: Colors.deepOrange),
                        child: Center(
                            child: Row(children: [
                          SizedBox(
                            width: 7,
                          ),
                          Icon(
                            Icons.share,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Container(
                            height: 30,
                            width: 2,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Icon(
                            Icons.copy,
                            color: Colors.white,
                          )
                        ])),
                      )
                    ],
                  ),
                  Spacer(),
                  Text(
                    '${body}',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 18,
                    ),
                  )
                ],
              ),
            ),
          ],
        )),
  );
}
