part of 'get_weather_cubit.dart';

@immutable
abstract class GetWeatherState {}

class GetWeatherInitial extends GetWeatherState {}

class NoWeather extends GetWeatherState {}

class WeatherLoaded extends GetWeatherState {
  final WeatherModel weatherModel;

  WeatherLoaded(this.weatherModel);
}

class WeatherFailure extends GetWeatherState {
  final String errorMessage;

  WeatherFailure(this.errorMessage);
}
