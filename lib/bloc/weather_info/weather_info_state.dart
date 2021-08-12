import 'package:equatable/equatable.dart';
import 'package:weather_app/models/weather_info.dart';

abstract class WeatherInfoState extends Equatable{
}

class Loading extends WeatherInfoState{
  @override
  List<Object?> get props => [];
}

class Loaded extends WeatherInfoState{
  final List<WeatherInfo> weatherInfo;

  Loaded(this.weatherInfo);
  @override
  List<Object?> get props => [weatherInfo];
}

class FailToLoad extends WeatherInfoState{
  final String error;

  FailToLoad(this.error);
  @override
  List<Object?> get props => [error];
}