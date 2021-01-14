import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather/domain/model/city.dart';
import 'package:weather/presentation/common/my_loading.dart';
import 'package:weather/presentation/home/home_bloc.dart';

class CustomSearchDelegate extends SearchDelegate<City> {
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
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
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final bloc = Provider.of<HomeBLoC>(context, listen: false);
    bloc.onListenerQuery(query);
    return AnimatedBuilder(
      animation: Listenable.merge([bloc.loading, bloc.searchCities]),
      child: const MyLoading(),
      builder: (_, child) {
        if (bloc.loading.value) {
          return child;
        }
        return ListView.builder(
          itemCount: bloc.searchCities.value.length,
          itemBuilder: (_, int index) {
            return ListTile(
              title: Text('${bloc.searchCities.value[index].title}'),
              subtitle: Text('${bloc.searchCities.value[index].type}'),
              onTap: () {
                bloc.addMyCity(bloc.searchCities.value[index]);
                close(context, null);
              },
            );
          },
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final bloc = Provider.of<HomeBLoC>(context, listen: false);
    final myList = bloc.myCities.value.where((item) => item.title.toLowerCase().contains(query.toLowerCase())).toList();
    return ListView.builder(
      itemCount: myList.length,
      itemBuilder: (_, int index) {
        return ListTile(
          title: Text('${bloc.myCities.value[index].title}'),
          subtitle: Text('${bloc.myCities.value[index].type}'),
          leading: Icon(Icons.history),
        );
      },
    );
  }
}
