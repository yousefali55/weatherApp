import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/Cubits/Weather/weather_change_cubit.dart';
import 'package:weather/Screens/no_weather_screen.dart';
import 'package:weather/Screens/search_screen.dart';
import 'package:weather/Screens/weather_screen.dart';

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('WeatherApp'),
          actions: [
            IconButton(
              icon: const Icon(Icons.search),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>  const SearchScreen(),
                  ),
                );
              },
            )
          ],
        ),
        body: BlocBuilder<WeatherChangeCubit, WeatherChangeState>(
          builder: (context, state) {
            if (state is WeatherChangeInitial) {
              return const NoWeather();
            } else if (state is WeatherChangeLoaded) {
              state.weatherModel;
              return WeatherScreen(
                weatherModel: state.weatherModel,
              );
            } else if(state is WeatherChangeFailure){
              return const Text('Oh no Sorry connect to The internet');
            }
            else{
              return const Text("hahah");
            }
          },
        ),
        );
  }
}

