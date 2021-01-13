import 'package:flutter/foundation.dart';
import 'package:weather/domain/model/city.dart';
import 'package:weather/domain/repository/api_repository.dart';

class HomeBLoC extends ChangeNotifier {
  final ApiRepository repository;

  ValueNotifier<List<City>> _cities;
  ValueNotifier<List<City>> get cities => _cities;

  HomeBLoC({@required this.repository}) {
    _init();
  }

  void _init() {
    _cities = ValueNotifier([]);
  }
}
