import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherapp/controller/controller.dart';
import 'package:weatherapp/services/weather_model.dart';

part 'home_controller_event.dart';
part 'home_controller_state.dart';

class HomeControllerBloc
    extends Bloc<HomeControllerEvent, HomeControllerState> {
  HomeControllerBloc() : super(HomeControllerInitial()) {
    on<InitialWeather>((event, emit) {
      emit(
        HomeControllerState(
          weatherData: weather, searchData: weather,
          // weatherService.getWeather('kochi'),
        ),
      );
    });

//searchh============================================
    on<InitialSearch>((event, emit) {
      emit(HomeControllerState(searchData: weather, weatherData: weather));
    });

    on<SearchUpdate>((event, emit) async {
      final searchData = weatherService.getWeather(place: event.val,);
      emit(HomeControllerState(
          searchData: await searchData, weatherData: await searchData));
    });
  }
}
