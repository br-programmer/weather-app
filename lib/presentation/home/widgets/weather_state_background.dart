import 'package:flutter/material.dart';

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
    return AnimatedBuilder(
      animation: _controller,
      builder: (_, __) {
        return Positioned.fill(
          left: _movement * _controller.value,
          right: _movement * (1 - _controller.value),
          child: Image.asset('assets/weather_state/t.jpg', fit: BoxFit.cover),
        );
      },
    );
  }
}
