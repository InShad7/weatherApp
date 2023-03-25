// import 'dart:math';
import 'dart:ui';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:weatherapp/screen/home.dart';
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
          padding: EdgeInsets.only(
              top: mheight! / 90, left: mwidth! / 22, right: mwidth! / 22),
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: mheight! / 3.4,
            decoration: BoxDecoration(
              border: Border.all(color: whiteOp2(), width: 1.5),
              gradient: LinearGradient(
                colors: [whiteOp2(), whiteOp2()],
                // stops: const [1.0, 1.0],
              ),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Padding(
              padding: EdgeInsets.only(top: mheight! / 65, left: mwidth! / 30),
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
                                fontSize: mheight! / 33,
                                fontWeight: FontWeight.w500,
                                color: white(),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            Text(
                              country,
                              style: TextStyle(
                                  fontSize: mheight! / 37, color: white()),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                          padding: EdgeInsets.only(right: mwidth! / 22),
                          child: Icon(
                            myIcon,
                            size: mheight! / 16,
                            color: white(),
                          )
                          //  Image.asset('assets/images/mist.png'),
                          ),
                    ],
                  ),
                  kheight,
                  Padding(
                    padding: EdgeInsets.only(top: mheight! / 100),
                    child: Wrap(
                      children: [
                        Text(
                          tempC.toString(),
                          style: TextStyle(
                              fontSize: mheight! / 11.7,
                              fontWeight: FontWeight.w500,
                              color: white()),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: mheight! / 70),
                          child: Text(
                            '°C',
                            style: TextStyle(
                                fontSize: mheight! / 29,
                                color: Colors.amber,
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
                    style: TextStyle(fontSize: mheight! / 46, color: white()),
                  ),
                  kheight20,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        DateFormat("y MMM dd ").format(date),
                        style:
                            TextStyle(fontSize: mheight! / 46, color: white()),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 18.0),
                        child: Text(
                          isDay,
                          // DateFormat("hh:mm a ").format(date),
                          style: TextStyle(
                              fontSize: mheight! / 49, color: white()),
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
