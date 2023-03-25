// import 'dart:math';
import 'dart:ui';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:weatherapp/utils/utils.dart';

class MainCard extends StatelessWidget {
  IconData? myIcon;

  MainCard(
      {super.key,
      required this.location,
      required this.condition,
      required this.country,
      required this.date,
      required this.img,
      required this.tempC,
      required this.isDay,
      required this.myIcon});

  var location, tempC, condition, country, date, img, isDay;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: 300,
            decoration: BoxDecoration(
              border: Border.all(color: whiteOp2(), width: 1.5),
              gradient: LinearGradient(
                colors: [whiteOp2(), whiteOp2()],
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
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              location,
                              style: TextStyle(
                                fontSize: 33,
                                fontWeight: FontWeight.w500,
                                color: white(),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            Text(
                              country,
                              style: TextStyle(fontSize: 26, color: white()),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                          padding: const EdgeInsets.only(right: 10.0),
                          child: Icon(
                            myIcon,
                            size: 60,
                            color: Colors.white,
                          )
                          //  Image.asset('assets/images/mist.png'),
                          ),
                    ],
                  ),
                  kheight,
                  Padding(
                    padding: const EdgeInsets.only(top: 3.0),
                    child: Wrap(
                      children: [
                        Text(
                          tempC.toString(),
                          style: TextStyle(
                              fontSize: 80,
                              fontWeight: FontWeight.w500,
                              color: white()),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 17.0),
                          child: Text(
                            '°C',
                            style: TextStyle(
                                fontSize: 30,
                                color: white(),
                                fontFeatures: const [
                                  FontFeature.superscripts()
                                ]),
                          ),
                        ),
                      ],
                    ),
                  ),
                  kheight,
                  Text(
                    condition,
                    style: TextStyle(fontSize: 20, color: white()),
                  ),
                  kheight20,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        DateFormat("y MMM dd ").format(date),
                        style: TextStyle(fontSize: 18, color: white()),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 18.0),
                        child: Text(
                          isDay,
                          // DateFormat("hh:mm a ").format(date),
                          style: TextStyle(fontSize: 18, color: white()),
                        ),
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
