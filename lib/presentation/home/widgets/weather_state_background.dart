import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather/presentation/home/home_bloc.dart';

class WeatherStateBackground extends StatefulWidget {
  const WeatherStateBackground({Key key}) : super(key: key);

  @override
  _WeatherStateBackgroundState createState() => _WeatherStateBackgroundState();
}

class _WeatherStateBackgroundState extends State<WeatherStateBackground> with SingleTickerProviderStateMixin {
  AnimationController _controller;
  final _movement = -50.0;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 4),
    )..repeat(reverse: true);
    super.initState();
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of<HomeBLoC>(context, listen: false);
    return AnimatedBuilder(
      animation: Listenable.merge([_controller, bloc.currentPage]),
      builder: (_, __) {
        final weather = bloc.myCities.value[bloc.currentPage.value].weathers.first;
        return Positioned(
          height: MediaQuery.of(context).size.height,
          left: _movement * _controller.value,
          right: _movement * (1 - _controller.value),
          child: AnimatedSwitcher(
            duration: const Duration(milliseconds: 600),
            child: Image.asset(
              'assets/weather_state/${weather.weatherStateAbbr}.jpg',
              key: ValueKey(weather.weatherStateAbbr),
              fit: BoxFit.cover,
            ),
          ),
        );
      },
    );
  }
}
