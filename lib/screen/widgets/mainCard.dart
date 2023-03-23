import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:weatherapp/utils/utils.dart';

class MainCard extends StatelessWidget {
  const MainCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: 300,
            decoration: BoxDecoration(
              border:
                  Border.all(color: whiteOp2(), width: 1.5),
              gradient: LinearGradient(
                colors: [
                 whiteOp2(),
                 whiteOp2()
                ],
                // stops: const [1.0, 1.0],
              ),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Padding(
              padding: const EdgeInsets.only(top: 16.0, left: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Column(
                        children:  [
                          Text(
                            "Place",
                            style: TextStyle(fontSize: 38, color: white()),
                          ),
                          Text(
                            "country",
                            style: TextStyle(fontSize: 26, color: white()),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 200.0, top: 5),
                        child: Image.asset('assets/images/cloud.png'),
                      ),
                    ],
                  ),
                  kheight,
                  Padding(
                    padding: const EdgeInsets.only(top: 3.0),
                    child: Wrap(
                      children:  [
                        Text(
                          "28",
                          style: TextStyle(fontSize: 80, color:white()),
                        ),
                        Padding(
                          padding:const EdgeInsets.only(top: 17.0),
                          child: Text(
                            '°C',
                            style: TextStyle(
                                fontSize: 30,
                                color: white(),
                                fontFeatures: const[FontFeature.superscripts()]),
                          ),
                        ),
                      ],
                    ),
                  ),
                  kheight,
                   Text(
                    'Sunny',
                    style: TextStyle(fontSize: 20, color: white()),
                  ),
                  kheight20,
                  Row(
                    children: [
                      Text(
                        '22-03-2023',
                        style: TextStyle(fontSize: 18, color:white()),
                      ),
                      kwidth200,
                      Text(
                        'day',
                        style: TextStyle(fontSize: 18, color: white()),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
