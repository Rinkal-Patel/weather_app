import 'package:equatable/equatable.dart';

abstract class WeatherDetailEvent extends Equatable{
}

class Fetch extends WeatherDetailEvent{
  final String date;
  Fetch(this.date);
  @override
  List<Object?> get props => [date];
}