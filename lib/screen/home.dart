import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:weatherapp/controller/home_controller/home_controller_bloc.dart';
import 'package:weatherapp/screen/widgets/detailsCard.dart';
import 'package:weatherapp/screen/widgets/iconData.dart';
import 'package:weatherapp/screen/widgets/mainCard.dart';
import 'package:weatherapp/screen/widgets/middleCard.dart';
import 'package:weatherapp/screen/widgets/searchField.dart';
import 'package:weatherapp/services/weather_model.dart';
import 'package:weatherapp/services/weather_service.dart';
import 'package:weatherapp/utils/utils.dart';

WeatherService weatherService = WeatherService();
Weather weather = Weather();

double? mheight;
double? mwidth;

class Home extends StatelessWidget {
  Home({super.key});

  var wind,
      humidity,
      cloud,
      precipitation,
      pressure,
      uv,
      visibility,
      windDirection,
      name,
      country,
      condition,
      img,
      tempC,
      isDay;
  // DateTime date = DateTime.now();
  DateTime lastUpdate = DateTime.now();
  bool isLoading = false;

  Future getData(context) async {
    if (textController.text.isEmpty) {
      weather = await weatherService.getWeather('kochi');
      BlocProvider.of<HomeControllerBloc>(context).add(InitialWeather());
    } else {
      BlocProvider.of<HomeControllerBloc>(context)
          .add(SearchUpdate(val: textController.text));
      await Future.delayed(Duration(seconds: 3));
      weather = await weatherService.getWeather(textController.text);
      log(textController.toString());
    }
    print(textController.text);

    // setState(() {
    //   wind = weather.windKph;
    //   humidity = weather.humidity;
    //   cloud = weather.cloud;
    //   DateTime date = DateTime.parse(weather.localTime);
    //   precipitation = weather.precipitation;
    //   pressure = weather.pressure;
    //   uv = weather.uv;
    //   windDirection = weather.windDirection;
    //   visibility = weather.visibility;
    //   lastUpdate = DateTime.parse(weather.lastUpdate);
    //   name = weather.name;
    //   country = weather.country;
    //   condition = weather.condition;
    //   tempC = weather.tempeC;
    //   img = weather.condition;
    //   isDay = weather.isDay;
    //   isLoading = false;
    // });
  }

  @override
  Widget build(BuildContext context) {
    mheight = MediaQuery.of(context).size.height;
    mwidth = MediaQuery.of(context).size.width;
    DateTime date = DateTime.now();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<HomeControllerBloc>(context).add(InitialWeather());
    });
    return BlocBuilder<HomeControllerBloc, HomeControllerState>(
      builder: (context, state) {
        // DateTime date = DateTime.now();
        // date = DateTime.parse(state.weatherData.localTime);
        late String mdate = state.weatherData.localTime;
        log(mdate);
        // log(state.weatherData.localTime);
        return Scaffold(
            appBar: AppBar(
              elevation: 0,
              title: Text(
                'Today\'s Weather',
                style: TextStyle(fontSize: mheight! / 38),
              ),
              centerTitle: true,
              actions: [
                IconButton(
                    onPressed: () async {
                      log(textController.text);
                      textController.clear();
                      await Future.delayed(Duration(seconds: 1));
                      // weather = await weatherService.getWeather('kochi');
                      await getData(context);
                    },
                    icon: Icon(
                      Icons.refresh_rounded,
                      size: mheight! / 33,
                    ))
              ],
              backgroundColor: state.weatherData.isDay == 1 ? blue() : night(),
            ),
            body: weather == null
                ? const Text('Oops..!')
                : Container(
                    color: state.weatherData.isDay == 1 ? blue() : night(),
                    child: ListView(
                      children: [
                        SearchField(weatherFun: getData(context)),
                        MainCard(
                          location:
                              '${state.weatherData.name.toString()}, ${state.weatherData.region}',
                          condition: state.weatherData.condition.toString(),
                          country: state.weatherData.country.toString(),
                          date: mdate,
                          img: state.weatherData.condition,
                          tempC: state.weatherData.tempeC,
                          isDay: state.weatherData.isDay == 1 ? 'DAY' : 'Night',
                          myIcon: getIcon(state.weatherData.condition),
                        ),
                        MiddleCard(
                          heading: 'WIND | HUMIDITY | CLOUD',
                          icon1: Icons.air,
                          title1: state.weatherData.windKph.toString(),
                          icon2: Icons.water_drop_outlined,
                          title2: state.weatherData.humidity.toString(),
                          icon3: Icons.cloud_outlined,
                          title3: state.weatherData.cloud.toString(),
                        ),
                        MiddleCard(
                          heading: 'SUNRISE & SUNSET',
                          icon1: Icons.wb_sunny_outlined,
                          title1: '6:27 AM',
                          icon2: Icons.schedule,
                          title2: mdate,
                          icon3: Icons.nights_stay,
                          title3: '6:35 PM',
                        ),
                        DetailsCard(
                          precipitation: state.weatherData.precipitation,
                          wind: state.weatherData.windDirection,
                          pressure: state.weatherData.pressure,
                          uv: state.weatherData.uv,
                          visibility: state.weatherData.visibility,
                          lastUpdate: lastUpdate,
                        ),
                        kheight,
                        kheight,
                      ],
                    ),
                  ));
      },
    );
  }
}
