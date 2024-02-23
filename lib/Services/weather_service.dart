import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:weather/Model/api_model.dart';

class WeatherService {
  final Dio dio;

  WeatherService(this.dio);
  Future<WeatherModel> getWeatherInfo({required String cityName}) async {
    const String baseUrl = 'https://api.weatherapi.com';
    const String apiKey = '21f8cf978a414452af3133406230610';
    try {
      Response response =
          await dio.get('$baseUrl/v1/forecast.json?key=$apiKey&q=$cityName');
      WeatherModel weatherModel = WeatherModel.fromjson(response.data);
      return weatherModel;
    } on DioException catch (e) {
      final String errorMessage =
          e.response?.data['error']['message'] ?? 'Oops, try again later';
      throw Exception(errorMessage);
    } catch (e) {
      log(e.toString());
      throw Exception('Oops, try again later');
    }
  }
}
