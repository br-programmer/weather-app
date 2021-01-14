import 'package:flutter/foundation.dart';
import 'package:weather/domain/model/city.dart';
import 'package:weather/domain/repository/api_repository.dart';
import 'package:weather/domain/request/city_request.dart';
import 'package:weather/presentation/common/debounce.dart';

class HomeBLoC extends ChangeNotifier {
  final ApiRepository repository;
  Debounce _debounce;

  ValueNotifier<List<City>> _cities;
  ValueNotifier<List<City>> get cities => _cities;
  ValueNotifier<bool> _loading;
  ValueNotifier<bool> get loading => _loading;

  HomeBLoC({@required this.repository}) {
    _init();
  }

  void _init() {
    _cities = ValueNotifier([]);
    _loading = ValueNotifier(false);
    _debounce = Debounce(duration: const Duration(milliseconds: 700));
  }

  @override
  void dispose() {
    _debounce?.cancel();
    super.dispose();
  }

  void onListenerQuery(String query) {
    if (query.trim().length >= 3) {
      _debounce.cancel();
      _loading.value = true;
      _debounce.create(() => _searchCities(query));
    } else {
      _debounce.cancel();
      _loading.value = false;
    }
  }

  Future<void> _searchCities(String query) async {
    final data = await repository.getCities(CityRequest(query: query));
    _cities.value = data.cities;
    _loading.value = false;
  }
}
