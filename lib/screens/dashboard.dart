import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/bloc/weather_info/weather_info_bloc.dart';
import 'package:weather_app/bloc/weather_info/weather_info_event.dart';
import 'package:weather_app/bloc/weather_info/weather_info_state.dart';
import 'package:weather_app/network/webservice.dart';

import 'detail.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    weatherInfoBloc.add(Fetch());
  }

  WeatherInfoBloc weatherInfoBloc = WeatherInfoBloc(Loading());

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Container(
      child: BlocBuilder<WeatherInfoBloc, WeatherInfoState>(
          bloc: weatherInfoBloc,
          builder: (context, state) {
            if (state is Loading) {
              return CircularProgressIndicator();
            } else if (state is Loaded) {
              return Container(
                height: 157,
                child: ListView.builder(
                  itemCount: state.weatherInfo.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Detail(
                                  state.weatherInfo[index].applicableDate)),
                        );
                      },
                      child: Container(
                        width: width - 16,
                        child: Card(
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 5),
                            child: Column(
                              children: [
                                Text(
                                  state.weatherInfo[index].weatherStateName,
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontStyle: FontStyle.italic,
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: 1),
                                ),
                                Image.network(
                                  "https://www.metaweather.com/static/img/weather/png/${state.weatherInfo[index].weatherStateAbbr}.png",
                                  height: 100,
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              );
            } else if (state is FailToLoad) {
              return Text(
                "Fail to load data",
                style: TextStyle(color: Colors.red),
              );
            }
            return Text(state.toString());
          }),
    );
  }
}
