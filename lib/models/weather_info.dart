class WeatherInfo{
  int id;
  String weatherStateName;
  String weatherStateAbbr;
  String windDirectionCompass;
  String created;
  String applicableDate;
  double minTemp;
  double maxTemp;
  double theTemp;
  double windSpeed;
  double windDirection;
  double airPressure;
  int humidity;
  int predictability;
  WeatherInfo(this.id, this.weatherStateName, this.weatherStateAbbr,
  this.windDirectionCompass, this.created, this.applicableDate,
      this.minTemp, this.maxTemp, this.theTemp, this.windSpeed, this.windDirection,
      this.airPressure, this.humidity, this.predictability);
  WeatherInfo.fromMap(Map<String, dynamic> json)
      : id = json["id"],
        weatherStateName = json["weather_state_name"],
        weatherStateAbbr = json["weather_state_abbr"],
        windDirectionCompass = json["wind_direction_compass"],
        created = json["created"],
        applicableDate = json["applicable_date"],
        minTemp = json["min_temp"],
        maxTemp = json["max_temp"],
        theTemp = json["the_temp"],
        windSpeed = json["wind_speed"],
        windDirection = json["wind_direction"],
        airPressure = json["air_pressure"],
        humidity = json["humidity"],
        predictability = json["predictability"];
}