import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather/domain/model/city.dart';
import 'package:weather/presentation/home/home_bloc.dart';

class PageViewCities extends StatelessWidget {
  const PageViewCities({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of<HomeBLoC>(context, listen: false);
    return ValueListenableBuilder<List<City>>(
        valueListenable: bloc.myCities,
        builder: (_, cities, __) {
          return PageView.builder(
            itemCount: cities.length,
            controller: bloc.controller,
            onPageChanged: bloc.setPage,
            itemBuilder: (_, i) {
              final city = cities[i];
              return Padding(
                padding: const EdgeInsets.only(top: kToolbarHeight * 3.25),
                child: Container(
                  child: Column(
                    children: [
                      Text(
                        '${city.title}, ${city.type}',
                        style: Theme.of(context).textTheme.headline4.copyWith(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        });
  }
}
