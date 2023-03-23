import 'package:flutter/material.dart';
import 'package:weatherapp/utils/utils.dart';

class DetailsRow extends StatelessWidget {
  String title, title2, title3;
  String data, data2, data3;

  DetailsRow(
      {super.key,
      required this.title,
      required this.data,
      required this.title2,
      required this.data2,
      required this.title3,
      required this.data3});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Column(
          children: [
            Text(
              title,
              style: TextStyle(color: white70(), fontSize: 16),
            ),
            Text(
              data,
              style: TextStyle(color: white(), fontSize: 16),
            ),
          ],
        ),
        Column(
          children: [
            Text(
              title2,
              style: TextStyle(color: white70(), fontSize: 16),
            ),
            Text(
              data2,
              style: TextStyle(color: white(), fontSize: 16),
            ),
          ],
        ),
        // Column(
        //   children: [
        //     Text(
        //       title3,
        //       style: TextStyle(color: white70(), fontSize: 16),
        //     ),
        //     Text(
        //       data3,
        //       style: TextStyle(color: white(), fontSize: 16),
        //     ),
        //   ],
        // ),
      ],
    );
  }
}
