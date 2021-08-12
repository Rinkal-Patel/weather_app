import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/bloc/weather_detail/weather_detail_event.dart';
import 'package:weather_app/bloc/weather_info/weather_info_state.dart';
import 'package:weather_app/models/weather_info.dart';
import 'package:weather_app/network/webservice.dart';

class WeatherDetailBloc extends Bloc<WeatherDetailEvent, WeatherInfoState> {
  WeatherDetailBloc(WeatherInfoState initialState) : super(initialState);

  @override
  Stream<WeatherInfoState> mapEventToState(WeatherDetailEvent event) async* {
    if (event is Fetch) {
      try {
        yield Loading();
        Webservice ws = new Webservice();
        String date = event.date;
        String result = date.replaceAll('-', '/');
        final List<WeatherInfo> weatherInfo = await ws.getWeatherDetailInfo(result);
        yield Loaded(weatherInfo);
      } catch (e) {
        yield FailToLoad(e.toString());
      }
    }
  }
}