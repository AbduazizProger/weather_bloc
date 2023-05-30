part of 'weather_bloc.dart';

abstract class WeatherEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class FirstWeatherEvent extends WeatherEvent {
  final String city;
  FirstWeatherEvent({required this.city});
}

class AskWeatherEvent extends WeatherEvent {
  final String city;
  AskWeatherEvent({required this.city});
}
