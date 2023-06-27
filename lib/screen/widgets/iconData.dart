import 'package:flutter/material.dart';

getIcon(val) {
  switch (val) {
    case 'Partly cloudy':
      return Icons.wb_cloudy;
    case 'Clear':
    case 'Sunny':
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
    case 'Moderate or heavy rain with thunder':
      return Icons.cloudy_snowing;
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
    case 'Moderate rain':
      return Icons.thunderstorm_outlined;
    default:
      return Icons.cloud_outlined;
  }
}
