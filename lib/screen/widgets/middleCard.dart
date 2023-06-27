import 'package:flutter/material.dart';
import 'package:weatherapp/controller/controller.dart';
import 'package:weatherapp/utils/utils.dart';

class MiddleCard extends StatelessWidget {
  var icon1, icon2, icon3;

  var title1, title2, title3, heading;

  MiddleCard(
      {super.key,
      required this.icon1,
      required this.title1,
      required this.icon2,
      required this.title2,
      required this.icon3,
      required this.title3,
      required this.heading});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          top: mheight! / 90, left: mwidth! / 22, right: mwidth! / 22),
      child: Container(
        width: mwidth,
        height: mheight! / 7.5,
        decoration: BoxDecoration(
          border: Border.all(color: whiteOp2(), width: mwidth! / 200),
          gradient: LinearGradient(
            colors: [whiteOp2(), whiteOp2()],
            // stops: const [1.0, 1.0],
          ),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding: EdgeInsets.only(top: mheight! / 90),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(left: mwidth! / 28),
                child: Text(
                  heading,
                  style: TextStyle(color: white70, fontSize: mheight! / 65),
                ),
              ),
              kheight,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      Icon(
                        icon1,
                        size: mheight! / 28,
                        color: white,
                      ),
                      kheight,
                      Text(
                        title1,
                        style:
                            TextStyle(color: white, fontSize: mheight! / 55),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Icon(
                        icon2,
                        size: mheight! / 28,
                        color: white,
                      ),
                      kheight,
                      Text(
                        title2,
                        style:
                            TextStyle(color: white, fontSize: mheight! / 55),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Icon(
                        icon3,
                        size: mheight! / 28,
                        color: white,
                      ),
                      kheight,
                      Text(
                        title3,
                        style:
                            TextStyle(color: white, fontSize: mheight! / 55),
                      ),
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
