import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:weather/domain/model/city.dart';
import 'package:weather/domain/repository/api_repository.dart';
import 'package:weather/domain/request/city_request.dart';
import 'package:weather/presentation/common/debounce.dart';

class HomeBLoC extends ChangeNotifier {
  final ApiRepository repository;
  Debounce _debounce;

  ValueNotifier<List<City>> _myCities;
  ValueNotifier<List<City>> get myCities => _myCities;
  ValueNotifier<List<City>> _searchCities;
  ValueNotifier<List<City>> get searchCities => _searchCities;
  ValueNotifier<bool> _loading;
  ValueNotifier<bool> get loading => _loading;
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
    _loading = ValueNotifier(false);
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
      _debounce.cancel();
      _loading.value = true;
      _debounce.create(() => _search(query));
    } else {
      _debounce.cancel();
      _loading.value = false;
    }
  }

  void addMyCity(City city) {
    final tmp = List<City>.from(_myCities.value);
    tmp.add(city);
    _myCities.value = tmp;
  }

  Future<void> _search(String query) async {
    final data = await repository.getCities(CityRequest(query: query));
    if (data != null) {
      _searchCities.value = data.cities;
    }
    _loading.value = false;
  }

  void setPage(int page) => _currentPage.value = page;
}
