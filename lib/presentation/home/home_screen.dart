import 'package:flutter/material.dart';
import 'package:weather/presentation/home/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const _Body(),
          const MyCustomAppBar(),
        ],
      ),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const HomeEmpty();
  }
}
