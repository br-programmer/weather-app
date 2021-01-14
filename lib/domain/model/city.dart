import 'package:meta/meta.dart' show required;
import 'package:weather/domain/model/weather.dart';

class City {
  City({@required this.id, @required this.title, @required this.type, @required this.weathers});

  final int id;
  final String title;
  final String type;
  final List<Weather> weathers;

  factory City.fromJson(Map<String, dynamic> map) => City(
        id: map['woeid'],
        title: map['title'],
        type: map['location_type'],
        weathers:
            map['weathers'] != null ? (map['weathers'] as List).map((map) => Weather.fromJson(map)).toList() : null,
      );

  City fromWeathers(List<Weather> weathers) => City(
        id: id,
        title: title,
        type: type,
        weathers: weathers,
      );
}
