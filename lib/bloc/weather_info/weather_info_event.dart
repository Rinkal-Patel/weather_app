import 'package:equatable/equatable.dart';

abstract class WeatherInfoEvent extends Equatable{
}

class Fetch extends WeatherInfoEvent{
  @override
  List<Object?> get props => [];
}