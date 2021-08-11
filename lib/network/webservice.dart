import 'dart:convert';

import 'package:weather_app/models/weather_info.dart';
import 'package:http/http.dart' as http;
import 'package:weather_app/utils/const.dart';

class Webservice {
  Future<List<WeatherInfo>> getWeatherInfo() async {
    var client = http.Client();
    try {
      Uri uri = Uri.parse("${API_BASE_URL}/${LOCATION_ID}");
      final response = await client.get(uri,headers: {'Content-Type': 'application/json'});
      final jsonResponse = response.body;
      final jsonMap = jsonDecode(jsonResponse);
      final weatherInfoJsonArray = jsonMap["consolidated_weather"];
      List<WeatherInfo> weatherInfo = List<WeatherInfo>.from(
          weatherInfoJsonArray.map((model) => WeatherInfo.fromMap(model)));
      return weatherInfo;
    } catch (e) {
      return [];
    } finally {
      client.close();
    }
  }

  Future<List<WeatherInfo>> getWeatherDetailInfo(String date) async {
    var client = http.Client();
    try {
      final response =
          await client.get(Uri.parse("${API_BASE_URL}/${LOCATION_ID}/${date}"));
      final jsonResponse = response.body;
      final weatherInfoJsonArray = jsonDecode(jsonResponse);
      List<WeatherInfo> weatherInfo = List<WeatherInfo>.from(
          weatherInfoJsonArray.map((model) => WeatherInfo.fromMap(model)));
      return weatherInfo;
    } catch (e) {
      return [];
    } finally {
      client.close();
    }
  }
}
