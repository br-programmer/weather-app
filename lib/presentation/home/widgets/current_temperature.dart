import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather/presentation/home/home_bloc.dart';

class CurrentTemperature extends StatelessWidget {
  const CurrentTemperature({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of<HomeBLoC>(context, listen: false);
    return Align(
      child: ValueListenableBuilder<int>(
        valueListenable: bloc.currentPage,
        builder: (_, value, __) {
          final weather = bloc.myCities.value[value].weathers.first;
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  TweenAnimationBuilder<int>(
                    tween: IntTween(begin: 0, end: weather.theTemp.toInt()),
                    duration: const Duration(milliseconds: 600),
                    builder: (context, value, child) => Text(
                      (value < 10) ? '0${value.toString()}' : value.toString(),
                      style: Theme.of(context).textTheme.headline1.copyWith(fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 15),
                    child: Text(
                      '°C',
                      style: Theme.of(context).textTheme.headline4.copyWith(fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              Text(
                weather.weatherStateName,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headline5.copyWith(fontWeight: FontWeight.bold),
              ),
            ],
          );
        },
      ),
    );
  }
}
