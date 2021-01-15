import 'package:flutter/material.dart';
import 'package:weather/domain/model/city.dart';

class ListCity extends StatelessWidget {
  const ListCity({
    Key key,
    @required this.cities,
    this.isHistory = false,
    @required this.onTap,
    this.textEmpty = 'No cities found',
  }) : super(key: key);
  final List<City> cities;
  final bool isHistory;
  final ValueChanged<City> onTap;
  final String textEmpty;

  @override
  Widget build(BuildContext context) {
    return cities.isNotEmpty
        ? ListView.builder(
            itemCount: cities.length,
            itemBuilder: (_, int index) {
              return ListTile(
                title: Text(
                  '${cities[index].title}',
                  style:
                      Theme.of(context).textTheme.headline6.copyWith(color: Colors.black, fontWeight: FontWeight.w700),
                ),
                subtitle: Text(
                  '${cities[index].type}',
                  style: Theme.of(context)
                      .textTheme
                      .subtitle1
                      .copyWith(color: Colors.black54, fontWeight: FontWeight.w600),
                ),
                leading: isHistory ? Icon(Icons.history) : null,
                onTap: () => onTap(cities[index]),
              );
            },
          )
        : Center(
            child: Text(textEmpty,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headline6.copyWith(color: Colors.black87)));
  }
}
