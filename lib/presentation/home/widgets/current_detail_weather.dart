import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather/presentation/home/home_bloc.dart';

class CurrentDetailtWeather extends StatelessWidget {
  const CurrentDetailtWeather({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: const EdgeInsets.only(bottom: kToolbarHeight * 1.25),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FractionallySizedBox(
              widthFactor: .95,
              child: Divider(height: 0, thickness: 1, color: Colors.white.withOpacity(.3)),
            ),
            const SizedBox(height: 20),
            const _DetailtWeather(),
          ],
        ),
      ),
    );
  }
}

class _DetailtWeather extends StatelessWidget {
  const _DetailtWeather({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of<HomeBLoC>(context, listen: false);
    return ValueListenableBuilder<int>(
      valueListenable: bloc.currentPage,
      builder: (_, value, __) {
        final weather = bloc.myCities.value[value].weathers.first;
        return Column(
          children: [
            Row(
              children: [
                Expanded(
                    child: _ItemDetailtWeather(
                        title: 'Wind', value: "${(weather.windSpeed * 1.6).toStringAsFixed(2)} km/h")),
                Expanded(
                  child: _ItemDetailtWeather(
                      title: 'Air pressure', value: '${weather.airPressure.toStringAsFixed(2)} mbar'),
                ),
                Expanded(
                  child: _ItemDetailtWeather(title: 'Humidity', value: '${weather.humidity}%'),
                ),
              ],
            ),
            const SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _ItemDetailtWeather(title: 'Temp min', value: weather.minTemp.toStringAsFixed(2)),
                _ItemDetailtWeather(title: 'Temp Max', value: weather.maxTemp.toStringAsFixed(2)),
              ],
            ),
          ],
        );
      },
    );
  }
}

class _ItemDetailtWeather extends StatelessWidget {
  final String title;
  final String value;

  const _ItemDetailtWeather({Key key, this.title, this.value}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(
          title,
          style: Theme.of(context).textTheme.subtitle2.copyWith(fontWeight: FontWeight.w700),
        ),
        const SizedBox(height: 5),
        Text(
          value,
          style: Theme.of(context).textTheme.headline6.copyWith(fontWeight: FontWeight.w700),
        ),
      ],
    );
  }
}
