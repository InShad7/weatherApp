import 'dart:developer';

import 'package:debouncer_widget/debouncer_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:weatherapp/controller/bloc/home_controller_bloc.dart';
import 'package:weatherapp/screen/widgets/detailsCard.dart';
import 'package:weatherapp/screen/widgets/mainCard.dart';
import 'package:weatherapp/screen/widgets/middleCard.dart';
import 'package:weatherapp/screen/widgets/searchField.dart';
import 'package:weatherapp/services/weather_model.dart';
import 'package:weatherapp/services/weather_service.dart';
import 'package:weatherapp/utils/utils.dart';

WeatherService weatherService = WeatherService();
Weather weather = Weather();

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
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
  DateTime date = DateTime.now();
  DateTime lastUpdate = DateTime.now();
  bool isLoading = false;

  @override
  void initState() {
    super.initState();

    getData();
  }

  Future getData() async {
    if (textController.text.isEmpty) {
      weather = await weatherService.getWeather('kochi');
      BlocProvider.of<HomeControllerBloc>(context).add(InitialWeather());
    } else {
      await Future.delayed(Duration(seconds: 3));
      weather = await weatherService.getWeather(textController.text);
      log(textController.toString());
    }
    print(textController.text);

    setState(() {
      wind = weather.windKph;
      humidity = weather.humidity;
      cloud = weather.cloud;
      DateTime date = DateTime.parse(weather.localTime);
      precipitation = weather.precipitation;
      pressure = weather.pressure;
      uv = weather.uv;
      windDirection = weather.windDirection;
      visibility = weather.visibility;
      lastUpdate = DateTime.parse(weather.lastUpdate);
      name = weather.name;
      country = weather.country;
      condition = weather.condition;
      tempC = weather.tempeC;
      img = weather.condition;
      isDay = weather.isDay;
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text(
          'Today\'s Weather',
          style: TextStyle(fontSize: 24),
        ),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () async {
                log(textController.text);
                textController.clear();
                await Future.delayed(Duration(seconds: 1));
                // weather = await weatherService.getWeather('kochi');
                await getData();
              },
              icon: const Icon(Icons.refresh_rounded))
        ],
        backgroundColor: isDay == 1 ? blue() : night(),
      ),
      body: weather == null
          ? Text('Oops..!')
          : BlocBuilder<HomeControllerBloc, HomeControllerState>(
              builder: (context, state) {
                return Container(
                  color: isDay == 1 ? blue() : night(),
                  child: ListView(
                    children: [
                      SearchField(weatherFun: getData()),
                      MainCard(
                          location: state.weatherData.name.toString(),
                          //  name.toString(),
                          condition:state.weatherData.condition.toString(),
                          country:state.weatherData.country.toString(),
                          date: date,
                          img: img,
                          tempC: tempC),
                      MiddleCard(
                        heading: 'WIND | HUMIDITY | CLOUD',
                        icon1: Icons.air,
                        title1: wind.toString(),
                        icon2: Icons.water_drop_outlined,
                        title2: humidity.toString(),
                        icon3: Icons.cloud_outlined,
                        title3: cloud.toString(),
                      ),
                      MiddleCard(
                        heading: 'SUNRISE & SUNSET',
                        icon1: Icons.wb_sunny_outlined,
                        title1: '6:27 AM',
                        icon2: Icons.schedule,
                        title2: DateFormat("hh:mm a ").format(date),
                        icon3: Icons.nights_stay,
                        title3: '6:35 PM',
                      ),
                      DetailsCard(
                        precipitation: precipitation,
                        wind: windDirection,
                        pressure: pressure,
                        uv: uv,
                        visibility: visibility,
                        lastUpdate: lastUpdate,
                      ),
                      kheight,
                      kheight,
                    ],
                  ),
                );
              },
            ),
    );
  }
}
