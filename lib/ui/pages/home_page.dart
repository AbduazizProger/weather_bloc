import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_bloc/bloc/weather_bloc.dart';
import 'package:weather_bloc/ui/components/show_weather.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final weather = context.watch<WeatherBloc>();
    if (weather.firstTime) {
      weather.add(FirstWeatherEvent(city: 'tashkent'));
    }
    weather.firstTime = false;
    final cityNameController = TextEditingController();
    bool shouldRefresh = false;
    Widget whenError() {
      shouldRefresh = true;
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              Image.asset('images/earth.jpg'),
              Image.asset('images/error.png'),
            ],
          ),
          const SizedBox(height: 20),
          const Text(
            'Checkout internet or try again',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
          ),
        ],
      );
    }

    return BlocBuilder<WeatherBloc, WeatherState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Colors.black,
          body: Center(
            child: state is WeatherLoadedState
                ? ShowWeather(
                    cityNameController: cityNameController,
                    state: state,
                  )
                : state is WeatherErrorState
                    ? whenError()
                    : const CircularProgressIndicator(),
          ),
          floatingActionButton: shouldRefresh
              ? FloatingActionButton(
                  onPressed: () {
                    if (shouldRefresh) {
                      weather.add(FirstWeatherEvent(city: 'tashkent'));
                    }
                  },
                  child: const Icon(Icons.refresh),
                )
              : null,
        );
      },
    );
  }
}
