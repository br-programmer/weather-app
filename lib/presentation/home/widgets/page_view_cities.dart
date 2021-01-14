import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
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
          itemBuilder: (_, i) => Padding(
            padding: const EdgeInsets.only(top: kToolbarHeight * 3.25, bottom: kToolbarHeight),
            child: Container(
              alignment: Alignment.topCenter,
              child: Column(
                children: [
                  Text(
                    cities[i].title,
                    style: Theme.of(context).textTheme.headline3.copyWith(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    DateFormat('E, dd MMM yyyy').format(cities[i].weathers.first.applicableDate),
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headline6.copyWith(fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
