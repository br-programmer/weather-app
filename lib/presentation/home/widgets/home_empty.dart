import 'package:flutter/material.dart';
import 'package:weather/presentation/common/app_colors.dart';

class HomeEmpty extends StatelessWidget {
  const HomeEmpty({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        const Background(),
        FractionallySizedBox(
          widthFactor: .7,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              FractionallySizedBox(child: Image.asset('assets/brand/logo.png'), widthFactor: .4),
              const SizedBox(height: 50),
              Text(
                'Hello,\nWelcome',
                style: Theme.of(context)
                    .textTheme
                    .headline4
                    .copyWith(color: AppColors.primaryColor, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 15),
              Text(
                'Click on the + icon to search for a city and start',
                style: Theme.of(context).textTheme.headline6.copyWith(fontWeight: FontWeight.w400),
              ),
            ],
          ),
        )
      ],
    );
  }
}

class Background extends StatefulWidget {
  const Background({Key key}) : super(key: key);

  @override
  _BackgroundState createState() => _BackgroundState();
}

class _BackgroundState extends State<Background> with SingleTickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 6), lowerBound: 0.0, upperBound: 0.5)
          ..reverse(from: 0.5)
          ..repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller?.dispose();
    print('dispose home-empty');
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      child: Image.asset('assets/welcome.jpg', fit: BoxFit.cover),
      builder: (_, child) => Transform.scale(scale: 1.5 - _controller.value, child: child),
    );
  }
}
