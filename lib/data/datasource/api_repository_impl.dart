import 'package:dio/dio.dart';
import 'package:weather/data/data_constants.dart';
import 'package:weather/domain/exception/api_exception.dart';
import 'package:weather/domain/model/city.dart';
import 'package:weather/domain/repository/api_repository.dart';
import 'package:weather/domain/response/city_response.dart';
import 'package:weather/domain/request/city_request.dart';

class ApiRepositoryImpl extends ApiRepository {
  final _dio = Dio(
    BaseOptions(baseUrl: server, connectTimeout: 5000, receiveTimeout: 10000),
  );
  CancelToken _cancelToken;

  @override
  Future<CityResponse> getCities(CityRequest request) async {
    _cancelToken = CancelToken();
    final response = await _dio.get(
      '$api/search/',
      queryParameters: {'query': request.query},
      cancelToken: _cancelToken,
    );
    if (response.statusCode == 200) {
      final cities = (response.data as List).map((map) => City.fromJson(map)).toList();
      return CityResponse(cities: cities);
    } else {
      throw ApiException(code: response.statusCode, text: response.statusMessage);
    }
  }

  @override
  void cancel() {
    if (_cancelToken.isCancelled) {
      _cancelToken?.cancel();
    }
  }
}
