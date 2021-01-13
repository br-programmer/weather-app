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
        Align(
          alignment: Alignment.topCenter,
          child: FractionallySizedBox(
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
          ),
        )
      ],
    );
  }
}

class Background extends StatelessWidget {
  const Background({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset('assets/welcome.jpg', fit: BoxFit.cover);
  }
}
