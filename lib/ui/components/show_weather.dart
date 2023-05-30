import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_bloc/bloc/weather_bloc.dart';
import 'package:weather_bloc/helpers/define_image.dart';

class ShowWeather extends StatelessWidget {
  const ShowWeather({
    super.key,
    required this.cityNameController,
    required this.state,
  });

  final TextEditingController cityNameController;
  final WeatherLoadedState state;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(defineImage(state.cityWeather.description)),
          fit: BoxFit.cover,
          colorFilter: const ColorFilter.mode(
            Colors.black38,
            BlendMode.darken,
          ),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(width: 20),
              Text(
                state.cityWeather.main,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 23,
                ),
              ),
              Image.network(
                'https://openweathermap.org/img/wn/${state.cityWeather.icon}@2x.png',
                height: 60,
              ),
            ],
          ),
          Text(
            'Weather in ${state.cityWeather.city} is: ${(state.cityWeather.temp - 273).round()} celcies',
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 23,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextField(
              onEditingComplete: () {
                if (cityNameController.text != '') {
                  BlocProvider.of<WeatherBloc>(context).add(
                    AskWeatherEvent(
                      city: cityNameController.text.toLowerCase(),
                    ),
                  );
                }
              },
              controller: cityNameController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.all(
                    Radius.circular(25),
                  ),
                ),
                filled: true,
                fillColor: Colors.white,
                hintText: 'City name',
                hintStyle: TextStyle(
                  fontSize: 18,
                ),
              ),
              style: const TextStyle(fontSize: 18),
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
