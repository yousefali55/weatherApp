import 'dart:developer';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:weather/Model/api_model.dart';
import 'package:weather/Services/weather_service.dart';

part 'weather_change_state.dart';

class WeatherChangeCubit extends Cubit<WeatherChangeState> {
  WeatherChangeCubit() : super(WeatherChangeInitial());
  getWeather({required String cityName})async{
  try {
    emit(WeatherChangeLoading());
    WeatherModel weatherModel = 
          await WeatherService((Dio())).getWeatherInfo(cityName: cityName);
    emit(WeatherChangeLoaded(weatherModel));
  }catch(e){
    log(e.toString());
    emit(WeatherChangeFailure());
  }
  }
}
