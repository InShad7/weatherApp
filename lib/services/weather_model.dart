
import 'package:flutter/material.dart';


class Weather {
  final String name;
  final String region;
  final String country;
  final String localTime;
  final double windKph;
  final int humidity;
  final int isDay;
  final double tempeC;
  final double feelsLikeC;
  final String condition;
  final double pressure;
  final double uv;
  final double precipitation;
  final double visibility;
  final int cloud;
  final String windDirection;
  final String lastUpdate;

  Weather(
      {this.name = '',
      this.region = '',
      this.country = '',
      this.localTime = '',
      this.windKph = 0,
      this.humidity = 0,
      this.isDay = 0,
      this.tempeC = 0,
      this.feelsLikeC = 0,
      this.condition = '',
      this.pressure = 0,
      this.uv = 0,
      this.precipitation = 0,
      this.visibility = 0,
      this.cloud = 0,
      this.windDirection = '',
      this.lastUpdate = ''});

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
      localTime: json['location']['localtime'],
      name: json['location']['name'],
      tempeC: json['current']['temp_c'],
      condition: json['current']['condition']['text'],
      region: json['location']['region'],
      country: json['location']['country'],
      feelsLikeC: json['current']['feelslike_c'],
      windKph: json['current']['wind_kph'],
      humidity: json['current']['humidity'],
      isDay: json['current']['is_day'],
      precipitation: json['current']['precip_in'],
      pressure: json['current']['pressure_in'],
      uv: json['current']['uv'],
      visibility: json['current']['vis_km'],
      cloud: json['current']['cloud'],
      windDirection: json['current']['wind_dir'],
      lastUpdate: json['current']['last_updated'],
    );
  }


  
  IconData getConditionIcon() {
    switch (condition) {
      case 'Partly cloudy':
        return Icons.wb_cloudy;
      case 'Clear':
        return Icons.wb_sunny;
      case 'Mist':
      case 'Fog':
        return Icons.cloud;
      case 'Overcast':
      case 'Cloudy':
        return Icons.cloud_queue;
      case 'Patchy rain possible':
      case 'Patchy light rain':
      case 'Light rain':
      case 'Moderate rain at times':
      case 'Heavy rain at times':
        return Icons.beach_access;
      case 'Patchy snow possible':
      case 'Patchy sleet possible':
      case 'Light sleet':
      case 'Moderate or heavy sleet':
      case 'Light snow':
      case 'Moderate snow':
      case 'Heavy snow':
      case 'Blizzard':
        return Icons.ac_unit;
      case 'Thundery outbreaks possible':
      case 'Patchy freezing drizzle possible':
      case 'Freezing drizzle':
      case 'Heavy freezing drizzle':
      case 'Patchy light drizzle':
      case 'Light drizzle':
      case 'Freezing fog':
      case 'Heavy freezing rain':
      case 'Light rain shower':
      case 'Moderate or heavy rain shower':
      case 'Torrential rain shower':
        return Icons.flash_on;
      default:
        return Icons.error_outline;
    }
  }
}
