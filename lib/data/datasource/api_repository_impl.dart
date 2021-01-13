import 'package:weather/domain/repository/api_repository.dart';
import 'package:weather/domain/response/city_response.dart';
import 'package:weather/domain/request/city_request.dart';

class ApiRepositoryImpl extends ApiRepository {
  @override
  Future<CityResponse> getCities(CityRequest request) async {
    return CityResponse(cities: []);
  }
}
