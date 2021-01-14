import 'package:weather/domain/model/city.dart';
import 'package:weather/domain/repository/api_repository.dart';
import 'package:weather/domain/response/city_response.dart';
import 'package:weather/domain/request/city_request.dart';

class ApiRepositoryImpl extends ApiRepository {
  @override
  Future<CityResponse> getCities(CityRequest request) async {
    await Future.delayed(const Duration(seconds: 2));
    return CityResponse(cities: List.generate(3, (i) => City(id: i, title: 'City: $i')));
  }
}
