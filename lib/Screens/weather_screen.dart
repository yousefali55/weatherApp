import 'package:flutter/material.dart';
import 'package:weather/Model/api_model.dart';
import 'package:weather/Styles/font_style.dart';

class WeatherScreen extends StatelessWidget {
  const WeatherScreen({super.key, required this.weatherModel});

  final WeatherModel weatherModel;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Expanded(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          Text(
            weatherModel.cityName,
            style: textStyle,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 20 / 425,
          ),
          Text('Updated at: ${weatherModel.date.hour}:${weatherModel.date.minute}',
          style: textStyle,),
          SizedBox(
            height: MediaQuery.of(context).size.height * 20 / 425,
          ),
          Row(
            children: [
              const Spacer(),
              Expanded(child: Image.network('https:${weatherModel.image!}')),
              const Spacer(),
              Text(weatherModel.temp.toString(),
              style: textStyle,),
              const Spacer(),
              Text(weatherModel.maxtemp.toString(),
              style: textStyle,),
              const Spacer(),
              Text(weatherModel.mintemp.toString(),
              style: textStyle,),
              const Spacer(),
              Text(weatherModel.condition!,
              style: textStyle,),
              const Spacer(),
            ],
          )
        ]),
      ),
    );
  }
}
