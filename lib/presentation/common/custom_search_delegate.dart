import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather/presentation/common/my_loading.dart';
import 'package:weather/presentation/home/home_bloc.dart';

class CustomSearchDelegate extends SearchDelegate {
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
      animation: Listenable.merge([bloc.loading, bloc.cities]),
      child: const MyLoading(),
      builder: (_, child) {
        if (bloc.loading.value) {
          return child;
        }
        return ListView.builder(
          itemCount: bloc.cities.value.length,
          itemBuilder: (_, int index) {
            return ListTile(
              title: Text('${bloc.cities.value[index].id}'),
              subtitle: Text(bloc.cities.value[index].title),
            );
          },
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final bloc = Provider.of<HomeBLoC>(context, listen: false);
    final myList = bloc.cities.value.where((item) => item.title.toLowerCase().contains(query.toLowerCase())).toList();
    return ListView.builder(
      itemCount: myList.length,
      itemBuilder: (_, int index) {
        return ListTile(
          title: Text('${myList[index].id}'),
          subtitle: Text(myList[index].title),
        );
      },
    );
  }
}
