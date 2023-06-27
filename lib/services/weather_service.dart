import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:weatherapp/controller/controller.dart';
import 'package:weatherapp/services/api.dart';
import 'package:http/http.dart' as http;
import 'package:weatherapp/services/weather_model.dart';

class WeatherService {
  Future<Weather> getWeather({dynamic lat, dynamic long, place}) async {
    final params;
    try {
      if (textController.text.isEmpty) {
        params = {
          'key': api_key,
          'q': '$lat,$long',
        };
      } else {
        params = {
          'key': api_key,
          'q': place,
        };
      }

      final uri = Uri.http('api.weatherapi.com', '/v1/current.json', params);
      final response = await http.get(uri);

      if (response.statusCode == 200 || response.statusCode <= 299) {
        // log(response.body.toString());
        return Weather.fromJson(jsonDecode(response.body));
      } else {
        log('Error: ${response.statusCode} - ${response.body}');

        final errorBody = jsonDecode(response.body);
        if (errorBody['error']['code'] == 1006) {
          Fluttertoast.showToast(msg: 'No matching location found');
        }

        Future.delayed(const Duration(milliseconds: 200), () {
          Fluttertoast.cancel();
        });
        throw Exception(
            'API call failed with status code ${response.statusCode}');
      }
    } catch (e) {
      print('Error: $e');
      if (e.toString().contains('Failed host lookup')) {
        Fluttertoast.showToast(
            msg: 'Oops..! \n There\'s no internet connection');
        // Fluttertoast.showToast(msg: 'push the refresh');
      }

      throw Exception('Failed to fetch weather data: $e');
    }
  }
}
