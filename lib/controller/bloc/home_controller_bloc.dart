
import 'package:bloc/bloc.dart';
import 'package:weatherapp/screen/home.dart';
import 'package:weatherapp/services/weather_model.dart';

part 'home_controller_event.dart';
part 'home_controller_state.dart';

class HomeControllerBloc
    extends Bloc<HomeControllerEvent, HomeControllerState> {
  HomeControllerBloc() : super(HomeControllerInitial()) {
    on<InitialWeather>((event, emit) {
      emit(
        HomeControllerState(
          weatherData: weather
          // weatherService.getWeather('kochi'),
        ),
      );
    });
  }
}
