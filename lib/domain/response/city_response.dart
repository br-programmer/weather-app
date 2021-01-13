import 'package:meta/meta.dart' show required;
import 'package:weather/domain/model/city.dart';

class CityResponse {
  final List<City> cities;
  CityResponse({@required this.cities});
}
