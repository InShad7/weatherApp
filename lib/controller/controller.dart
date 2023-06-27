import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weatherapp/controller/home_controller/home_controller_bloc.dart';
import 'package:weatherapp/screen/widgets/debouncer.dart';
import 'package:weatherapp/services/weather_model.dart';
import 'package:weatherapp/services/weather_service.dart';

Future getData(context) async {
  String? lat;
  String? long;

  if (textController.text.isEmpty) {
    final position = await getCurrentLocation();
    lat = '${position.latitude}';
    long = '${position.longitude}';
  } else {
    debouncer.run(() async {
      await Future.delayed(const Duration(seconds: 4));
      BlocProvider.of<HomeControllerBloc>(context)
          .add(SearchUpdate(val: textController.text.trim()));

      weather = await weatherService.getWeather(place: textController.text);
      log(textController.toString());
    });
  }

  if (lat != null && long != null) {
    weather = await weatherService.getWeather(lat: lat, long: long);
    BlocProvider.of<HomeControllerBloc>(context).add(InitialWeather());
  }
}

//get current location================================================

Future<Position> getCurrentLocation() async {
  bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {
    throw Exception('Location services are disabled');
  }

  LocationPermission permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      throw Exception('Location permission denied');
    }
  }

  if (permission == LocationPermission.deniedForever) {
    throw Exception('Location permission permanently denied');
  }

  return await Geolocator.getCurrentPosition(
    desiredAccuracy: LocationAccuracy.best,
  );
}

WeatherService weatherService = WeatherService();
Weather weather = Weather();

double? mheight;
double? mwidth;

DateTime lastUpdate = DateTime.now();

TextEditingController textController = TextEditingController();

final debouncer = Debouncer(milliseconds: 1000);
