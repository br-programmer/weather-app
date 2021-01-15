import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather/domain/model/city.dart';
import 'package:weather/presentation/common/list_city.dart';
import 'package:weather/presentation/common/my_loading.dart';
import 'package:weather/presentation/home/home_bloc.dart';

class CustomSearchDelegate extends SearchDelegate<City> {
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () => query = '',
      ),
    ];
  }

  @override
  ThemeData appBarTheme(BuildContext context) {
    return Theme.of(context);
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () => close(context, null),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final bloc = Provider.of<HomeBLoC>(context, listen: false);
    bloc.onListenerQuery(query);
    return AnimatedBuilder(
      animation: Listenable.merge([bloc.loadingCity, bloc.searchCities]),
      child: const MyLoading(),
      builder: (_, child) {
        if (bloc.loadingCity.value) {
          return child;
        }
        return ListCity(cities: bloc.searchCities.value, onTap: (city) => close(context, city));
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final bloc = Provider.of<HomeBLoC>(context, listen: false);
    final myList = bloc.myCities.value.where((item) => item.title.toLowerCase().contains(query.toLowerCase())).toList();
    final textEmpty = bloc.myCities.value.isEmpty
        ? 'No tienes ciudades en tu historial'
        : 'Ninguna ciudad de tu historial coincide con tu busqueda';
    return ListCity(cities: myList, isHistory: true, onTap: (city) => close(context, city), textEmpty: textEmpty);
  }
}
