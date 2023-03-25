import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weatherapp/screen/home.dart';
import 'package:weatherapp/screen/widgets/detailsRow.dart';
import 'package:weatherapp/screen/widgets/mainCard.dart';
import 'package:weatherapp/screen/widgets/searchField.dart';
import 'package:weatherapp/utils/utils.dart';

class DetailsCard extends StatelessWidget {
  DetailsCard(
      {super.key,
      required this.precipitation,
      required this.pressure,
      required this.uv,
      required this.visibility,
      required this.wind,
      required this.lastUpdate});
  var precipitation, pressure, uv, visibility, wind, humidity;

//   @override
//   State<DetailsCard> createState() => _DetailsCardState();
// }

// class _DetailsCardState extends State<DetailsCard> {
  DateTime lastUpdate = DateTime.now();

  // @override
  // void initState() {
  //   super.initState();

  //   getData();
  // }

  // void getData() async {
  //   if (textController.text.isEmpty) {
  //     weather = await weatherService.getWeather('Kochi');
  //   } else {
  //     weather = await weatherService.getWeather(textController.text);
  //   }
  //   // weather = await weatherService.getWeather('Kochi');
  //   setState(() {
  //     precipitation = weather.precipitation;
  //     pressure = weather.pressure;
  //     uv = weather.uv;
  //     wind = weather.windDirection;
  //     visibility = weather.visibility;
  //     lastUpdate = DateTime.parse(weather.lastUpdate);
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          top: mheight! / 90, left: mwidth! / 22, right: mwidth! / 22),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: mheight! / 3.9,
        decoration: BoxDecoration(
          border: Border.all(color: whiteOp2(), width: mwidth! / 200),
          gradient: LinearGradient(
            colors: [whiteOp2(), whiteOp2()],
            // stops: const [1.0, 1.0],
          ),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding: const EdgeInsets.all(21.0),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.spaceAround,
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DetailsRow(
                title: 'PRECIPITATION',
                data: precipitation.toString(),
                title2: 'WIND DIRECTION',
                data2: wind.toString(),
                title3: 'UV',
                data3: uv.toString(),
              ),
              DetailsRow(
                title: 'PRESSURE',
                data: pressure.toString(),
                title2: 'VISIBILITY',
                data2: visibility.toString(),
                title3: 'HUM',
                data3: humidity.toString(),
              ),
              DetailsRow(
                  title: 'UV',
                  data: uv.toString(),
                  title2: 'LAST UPDATED',
                  data2: DateFormat(" hh:mm a ").format(lastUpdate),
                  title3: 'uv',
                  data3: 'uv data'),
            ],
          ),
        ),
      ),
    );
  }
}
