import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather/presentation/home/widgets/widgets.dart'
    show CopyRightData, PageIndicator, PageViewCities, WeatherStateBackground;

class HomeWeathers extends StatelessWidget {
  const HomeWeathers({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        const WeatherStateBackground(),
        const PageIndicator(),
        const CopyRightData(),
        const PageViewCities(),
      ],
    );
  }
}
