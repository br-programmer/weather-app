import 'package:meta/meta.dart' show required;

class Weather {
  Weather({
    @required this.id,
    @required this.weatherStateName,
    @required this.weatherStateAbbr,
    @required this.windDirectionCompass,
    @required this.created,
    @required this.applicableDate,
    @required this.minTemp,
    @required this.maxTemp,
    @required this.theTemp,
    @required this.windSpeed,
    @required this.windDirection,
    @required this.airPressure,
    @required this.humidity,
    @required this.visibility,
    @required this.predictability,
  });

  final int id;
  final String weatherStateName;
  final String weatherStateAbbr;
  final String windDirectionCompass;
  final DateTime created;
  final DateTime applicableDate;
  final double minTemp;
  final double maxTemp;
  final double theTemp;
  final double windSpeed;
  final double windDirection;
  final double airPressure;
  final num humidity;
  final double visibility;
  final int predictability;

  factory Weather.fromJson(Map<String, dynamic> map) => Weather(
        id: map["id"],
        weatherStateName: map["weather_state_name"],
        weatherStateAbbr: map["weather_state_abbr"],
        windDirectionCompass: map["wind_direction_compass"],
        created: DateTime.parse(map["created"]),
        applicableDate: DateTime.parse(map["applicable_date"]),
        minTemp: map["min_temp"].toDouble(),
        maxTemp: map["max_temp"].toDouble(),
        theTemp: map["the_temp"].toDouble(),
        windSpeed: map["wind_speed"].toDouble(),
        windDirection: map["wind_direction"].toDouble(),
        airPressure: map["air_pressure"],
        humidity: map["humidity"],
        visibility: map["visibility"].toDouble(),
        predictability: map["predictability"],
      );
}
