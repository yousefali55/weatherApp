part of 'weather_change_cubit.dart';

sealed class WeatherChangeState {}

final class WeatherChangeInitial extends WeatherChangeState {}
final class WeatherChangeLoading extends WeatherChangeState{}
final class WeatherChangeLoaded extends WeatherChangeState{
  final WeatherModel weatherModel;
  WeatherChangeLoaded( this.weatherModel);
}
final class WeatherChangeFailure extends WeatherChangeState{}

