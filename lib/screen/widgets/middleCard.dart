import 'package:flutter/material.dart';
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
      padding: const EdgeInsets.all(16.0),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 135,
        decoration: BoxDecoration(
          border: Border.all(color: whiteOp2(), width: 1.5),
          gradient: LinearGradient(
            colors: [whiteOp2(), whiteOp2()],
            // stops: const [1.0, 1.0],
          ),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Text(
                  heading,
                  style: TextStyle(color: white70()),
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
                        size: 35,
                        color: white(),
                      ),
                      kheight,
                      Text(
                        title1,
                        style: TextStyle(color: white(), fontSize: 18),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Icon(
                        icon2,
                        size: 35,
                        color: white(),
                      ),
                      kheight,
                      Text(
                        title2,
                        style: TextStyle(color: white(), fontSize: 18),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Icon(
                        icon3,
                        size: 35,
                        color: white(),
                      ),
                      kheight,
                      Text(
                        title3,
                        style: TextStyle(color: white(), fontSize: 18),
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
