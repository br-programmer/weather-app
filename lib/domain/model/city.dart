import 'package:meta/meta.dart';

class City {
  final int id;
  final String title;
  final String type;

  City({@required this.id, @required this.title, @required this.type});

  factory City.fromJson(Map<String, dynamic> map) => City(
        id: map['woeid'],
        title: map['title'],
        type: map['location_type'],
      );
}
