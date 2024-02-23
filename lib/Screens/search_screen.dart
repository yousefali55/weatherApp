import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/Cubits/Weather/weather_change_cubit.dart';


class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Center(
          child: TextField(
            onSubmitted: (value){
              var getWeather = BlocProvider.of<WeatherChangeCubit>(context);
              getWeather.getWeather(cityName: value);
              Navigator.pop(context);
            },
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 32,
            ),
            suffixIcon: const Icon(Icons.search),
            labelText: 'Search',
            labelStyle: const TextStyle(
              color: Colors.green,
            ),
            hintText: 'Enter your location',
            alignLabelWithHint: true,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: const BorderSide(
                color: Colors.green,
              ),
            )
          ),
          textAlign: TextAlign.center,
        ), 
        ),
      ),
    );
  }
}
