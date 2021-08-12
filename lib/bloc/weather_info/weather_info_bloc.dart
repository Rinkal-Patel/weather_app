import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/bloc/weather_info/weather_info_event.dart';
import 'package:weather_app/bloc/weather_info/weather_info_state.dart';
import 'package:weather_app/models/weather_info.dart';
import 'package:weather_app/network/webservice.dart';

class WeatherInfoBloc extends Bloc<WeatherInfoEvent, WeatherInfoState> {
  WeatherInfoBloc(WeatherInfoState initialState) : super(initialState);

  @override
  Stream<WeatherInfoState> mapEventToState(WeatherInfoEvent event) async* {
    if (event is Fetch) {
      try {
        yield Loading();
        Webservice ws = new Webservice();
        final List<WeatherInfo> weatherInfo = await ws.getWeatherInfo();
        yield Loaded(weatherInfo);
      } catch (e) {
        yield FailToLoad(e.toString());
      }
    }
  }
}
