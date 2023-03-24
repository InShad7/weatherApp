import 'dart:convert';
import 'package:weatherapp/services/api.dart';
import 'package:http/http.dart' as http;
import 'package:weatherapp/services/weather_model.dart';

class WeatherService {
  Future<Weather> getWeather(String place) async {
    try {
      final params = {
        'key': api_key,
        'q': place,
      };
      final uri = Uri.http('api.weatherapi.com', '/v1/current.json', params);
      final response = await http.get(uri);
      // response.body == null ? Text('Oops! \n Connect to a network') : response;

      if (response.statusCode == 200 || response.statusCode <= 299) {
        return Weather.fromJson(jsonDecode(response.body));
      } else {
        print('Error: ${response.statusCode} - ${response.body}');
        throw Exception(
            'API call failed with status code ${response.statusCode}');
      }
    } catch (e) {
      print('Error: $e');
      throw Exception('Failed to fetch weather data: $e');
    }
  }
}
