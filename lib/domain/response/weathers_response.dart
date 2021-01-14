import 'package:meta/meta.dart' show required;
import 'package:weather/domain/model/city.dart';

class WeathersResponse {
  final City city;
  WeathersResponse({@required this.city});
}
