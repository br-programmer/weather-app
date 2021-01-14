import 'package:meta/meta.dart' show required;
import 'package:weather/domain/model/city.dart';

class WeathersRequest {
  final City city;
  WeathersRequest({@required this.city});
}
