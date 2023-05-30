class CityWeather {
  final String icon;
  final String main;
  final double temp;
  final String city;
  final double windSpeed;
  final String description;

  CityWeather({
    required this.city,
    required this.icon,
    required this.main,
    required this.temp,
    required this.windSpeed,
    required this.description,
  });

  factory CityWeather.fromJson(Map<String, dynamic> json) {
    final weather = json['weather'][0];
    final mainInfo = json['main'];
    final wind = json['wind'];

    return CityWeather(
      city: json['name'],
      icon: weather['icon'],
      main: weather['main'],
      temp: mainInfo['temp'].toDouble(),
      windSpeed: wind['speed'].toDouble(),
      description: weather['description'],
    );
  }
}
