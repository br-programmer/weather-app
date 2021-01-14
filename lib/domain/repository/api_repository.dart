import 'package:weather/domain/request/city_request.dart';
import 'package:weather/domain/request/weathers_request.dart';
import 'package:weather/domain/response/city_response.dart';
import 'package:weather/domain/response/weathers_response.dart';

abstract class ApiRepository {
  Future<CityResponse> getCities(CityRequest request);
  void cancel();
  Future<WeathersResponse> getWeathers(WeathersRequest request);
}
