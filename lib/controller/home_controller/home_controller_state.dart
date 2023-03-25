part of 'home_controller_bloc.dart';

class HomeControllerState {
  Weather weatherData;
  Weather searchData;

  HomeControllerState({required this.weatherData,required this.searchData});
}

class HomeControllerInitial extends HomeControllerState {
  HomeControllerInitial() : super(weatherData: weather,searchData:weather );
}


