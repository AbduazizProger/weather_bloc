part of 'weather_bloc.dart';

abstract class WeatherState extends Equatable {
  const WeatherState();

  @override
  List<Object> get props => [];
}

class WeatherLoadingState extends WeatherState {}

class WeatherLoadedState extends WeatherState {
  final CityWeather cityWeather;

  const WeatherLoadedState({required this.cityWeather});
}

class WeatherErrorState extends WeatherState {
  final String message;

  const WeatherErrorState({required this.message});
}
