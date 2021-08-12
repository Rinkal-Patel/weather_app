import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/bloc/weather_detail/weather_detail_bloc.dart';
import 'package:weather_app/bloc/weather_detail/weather_detail_event.dart';
import 'package:weather_app/bloc/weather_info/weather_info_state.dart';

class Detail extends StatefulWidget {
  final String date;
  Detail(this.date);
  @override
  _DetailState createState() => _DetailState();
}

class _DetailState extends State<Detail> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    weatherDetailBloc.add(Fetch(widget.date));
  }

  WeatherDetailBloc weatherDetailBloc = WeatherDetailBloc(Loading());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.date),
      ),
      body: Container(
        color: Colors.black12,
         child: Container(
            child: BlocBuilder<WeatherDetailBloc, WeatherInfoState>(
                bloc: weatherDetailBloc,
                builder: (context, state) {
                  if (state is Loading) {
                    return CircularProgressIndicator();
                  } else if (state is Loaded) {
                    return Container(
                      //height: 157,
                      child: ListView.builder(
                        itemCount: state.weatherInfo.length,
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
          )
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
