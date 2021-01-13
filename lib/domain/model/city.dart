import 'package:meta/meta.dart';

class City {
  final int id;
  final String title;

  City({@required this.id, @required this.title});

  factory City.fromJson(Map<String, dynamic> map) => City(
        id: map['woeid'],
        title: map['title'],
      );
}
