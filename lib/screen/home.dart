import 'package:flutter/material.dart';
import 'package:weatherapp/screen/widgets/detailsCard.dart';
import 'package:weatherapp/screen/widgets/mainCard.dart';
import 'package:weatherapp/screen/widgets/middleCard.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
        ),
        body: ListView(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              decoration: const BoxDecoration(
                  // image: DecorationImage(
                  //   image: AssetImage("assets/images/day1.jpg"),
                  //   fit: BoxFit.fill,
                  // ),
                  color: Colors.blue),
              child: Column(
                children: [
                  MainCard(),
                  MiddleCard(
                    heading: 'WIND | HUMIDITY | CLOUD',
                    icon1: Icons.air,
                    title1: 'Wind',
                    icon2: Icons.water_drop_outlined,
                    title2: 'Humidity',
                    icon3: Icons.cloud_outlined,
                    title3: 'Cloud',
                  ),
                  MiddleCard(
                    heading: 'SUNRISE & SUNSET',
                    icon1: Icons.wb_sunny_outlined,
                    title1: 'Sunrise',
                    icon2: Icons.schedule,
                    title2: 'Time',
                    icon3: Icons.nights_stay,
                    title3: 'Sunset',
                  ),
                  DetailsCard()
                ],
              ),
            ),
          ],
        ));
  }
}
