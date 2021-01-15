import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:weather/data/data_constants.dart';
import 'package:weather/domain/model/weather.dart';
import 'package:weather/presentation/common/app_colors.dart';
import 'package:weather/presentation/home/home_bloc.dart';

class Forecast extends StatelessWidget {
  const Forecast({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of<HomeBLoC>(context, listen: false);
    return Material(
      color: Colors.transparent,
      child: Container(
        height: MediaQuery.of(context).size.height * .65,
        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.vertical(top: Radius.circular(30))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 25),
              child: Text(
                '3 day forecast',
                style: Theme.of(context).textTheme.headline5.copyWith(color: Colors.black, fontWeight: FontWeight.bold),
              ),
            ),
            Expanded(
              child: ValueListenableBuilder<int>(
                valueListenable: bloc.currentPage,
                builder: (_, value, __) => ListView.builder(
                  padding: EdgeInsets.zero,
                  itemCount: 3,
                  itemBuilder: (_, index) => _ItemForecast(weather: bloc.myCities.value[value].weathers[index + 1]),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ItemForecast extends StatelessWidget {
  const _ItemForecast({Key key, @required this.weather}) : super(key: key);
  final Weather weather;

  @override
  Widget build(BuildContext context) {
    final myStyle = Theme.of(context).textTheme.headline6.copyWith(color: Colors.black, fontWeight: FontWeight.bold);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 7.5),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5),
          boxShadow: [BoxShadow(color: Colors.black.withOpacity(.1), blurRadius: 4, spreadRadius: 2)],
        ),
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
        child: Column(
          children: [
            Row(
              children: [
                Text(DateFormat('EEEE').format(weather.applicableDate), style: myStyle),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Image.network(
                    '${server}static/img/weather/png/${weather.weatherStateAbbr}.png',
                    height: 25,
                  ),
                ),
                const Spacer(),
                Text('⬇${weather.minTemp.toInt()}°C', style: myStyle),
                Text(' - ', style: myStyle),
                Text('⬆${weather.maxTemp.toInt()}°C', style: myStyle),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _ItemForecastWeather(title: 'Wind', value: "${(weather.windSpeed * 1.6).toStringAsFixed(2)} km/h"),
                _ItemForecastWeather(title: 'Air pressure', value: '${weather.airPressure.toStringAsFixed(2)} mbar'),
                _ItemForecastWeather(title: 'Humidity', value: '${weather.humidity}%'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _ItemForecastWeather extends StatelessWidget {
  final String title;
  final String value;

  const _ItemForecastWeather({Key key, this.title, this.value}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(
          title,
          style: Theme.of(context)
              .textTheme
              .button
              .copyWith(fontWeight: FontWeight.w500, color: AppColors.colorTextForecast),
        ),
        Text(
          value,
          style: Theme.of(context)
              .textTheme
              .subtitle1
              .copyWith(fontWeight: FontWeight.w500, color: AppColors.colorTextForecast),
        ),
      ],
    );
  }
}
