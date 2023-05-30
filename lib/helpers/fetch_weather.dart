import 'package:weather_bloc/models/city_weather.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

Future<CityWeather> fetchWeather(String city) async {
  final response = await http.get(
    Uri.parse(
      'https://api.openweathermap.org/data/2.5/weather?q=$city&appid=1122ef4673ecc1569e222296a246c7ec',
    ),
  );
  final data = CityWeather.fromJson(jsonDecode(response.body));
  return data;
}
