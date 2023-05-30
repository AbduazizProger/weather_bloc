import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:weather_bloc/helpers/fetch_weather.dart';
import 'package:weather_bloc/models/city_weather.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  bool firstTime = true;
  WeatherBloc() : super(WeatherLoadingState()) {
    on<FirstWeatherEvent>(
      (event, emit) async {
        try {
          emit(WeatherLoadedState(cityWeather: await fetchWeather(event.city)));
          print('${event.city} some');
        } catch (e) {
          emit(WeatherErrorState(message: e.toString()));
        }
      },
    );
    on<AskWeatherEvent>(
      (event, emit) async {
        emit(WeatherLoadingState());
        try {
          emit(WeatherLoadedState(cityWeather: await fetchWeather(event.city)));
          print('${event.city} some');
        } catch (e) {
          emit(WeatherErrorState(message: e.toString()));
        }
      },
    );
  }
}
