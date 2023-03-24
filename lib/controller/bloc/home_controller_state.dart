part of 'home_controller_bloc.dart';

class HomeControllerState {
  Weather weatherData;

  HomeControllerState({required this.weatherData});
}

class HomeControllerInitial extends HomeControllerState {
  HomeControllerInitial() : super(weatherData: weather);
}
