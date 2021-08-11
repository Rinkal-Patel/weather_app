import 'package:flutter/material.dart';
import 'package:weather_app/models/weather_info.dart';
import 'package:weather_app/network/webservice.dart';

class Dashboard extends StatefulWidget {
  final List<String> names = ["Rinkal 1", "Rinkal 2", "Rinkal 3"];

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  bool isLoading = true;
  List<WeatherInfo> weatherInfo = [];
  Webservice ws = new Webservice();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    ws.getWeatherInfo().then((value) => {
          setState(() {
            weatherInfo = value;
          })
        });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        itemCount: weatherInfo.length,
        itemBuilder: (context, index) {
          return Card(
            child: Text(weatherInfo[index].weatherStateName),
          );
        },
      ),
    );
  }
}
