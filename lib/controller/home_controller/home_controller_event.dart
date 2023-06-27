part of 'home_controller_bloc.dart';

class HomeControllerEvent {}

class InitialWeather extends HomeControllerEvent {
  InitialWeather();
  // Future<Weather> initialWether;
  // InitialWeather({required this.initialWether});
}

class InitialSearch extends HomeControllerEvent {}

class SearchUpdate extends HomeControllerEvent {
  String val;
  SearchUpdate({required this.val});
}
