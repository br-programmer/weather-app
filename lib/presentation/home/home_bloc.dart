import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:weather/domain/model/city.dart';
import 'package:weather/domain/repository/api_repository.dart';
import 'package:weather/domain/request/city_request.dart';
import 'package:weather/domain/request/weathers_request.dart';
import 'package:weather/presentation/common/debounce.dart';

class HomeBLoC extends ChangeNotifier {
  final ApiRepository repository;
  Debounce _debounce;

  ValueNotifier<List<City>> _myCities;
  ValueNotifier<List<City>> get myCities => _myCities;
  ValueNotifier<List<City>> _searchCities;
  ValueNotifier<List<City>> get searchCities => _searchCities;
  ValueNotifier<bool> _loadingCity;
  ValueNotifier<bool> get loadingCity => _loadingCity;
  ValueNotifier<bool> _loadingWeathers;
  ValueNotifier<bool> get loadingWeathers => _loadingWeathers;
  ValueNotifier<int> _currentPage;
  ValueNotifier<int> get currentPage => this._currentPage;
  PageController _controller;
  PageController get controller => _controller;

  HomeBLoC({@required this.repository}) {
    _init();
  }

  void _init() {
    _myCities = ValueNotifier([]);
    _searchCities = ValueNotifier([]);
    _loadingCity = ValueNotifier(false);
    _loadingWeathers = ValueNotifier(false);
    _currentPage = ValueNotifier(0);
    _controller = PageController();
    _debounce = Debounce(duration: const Duration(milliseconds: 700));
  }

  @override
  void dispose() {
    _debounce?.cancel();
    repository?.cancel();
    super.dispose();
  }

  void onListenerQuery(String query) {
    if (query.trim().length >= 3) {
      _debounce?.cancel();
      repository?.cancel();
      _loadingCity.value = true;
      _debounce?.create(() => _search(query));
    } else {
      _debounce?.cancel();
      repository?.cancel();
      _loadingCity.value = false;
    }
  }

  Future<void> addMyCity(City city) async {
    _loadingWeathers.value = true;
    final data = await repository.getWeathers(WeathersRequest(city: city));
    if (data != null) {
      final tmp = List<City>.from(_myCities.value);
      tmp.add(data.city);
      _myCities.value = tmp;
    }
    _loadingWeathers.value = false;
  }

  Future<void> _search(String query) async {
    final data = await repository.getCities(CityRequest(query: query));
    if (data != null) {
      _searchCities.value = data.cities;
    }
    _loadingCity.value = false;
  }

  void setPage(int page) => _currentPage.value = page;
}
