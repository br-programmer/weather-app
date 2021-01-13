import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather/domain/model/city.dart';
import 'package:weather/presentation/home/home_bloc.dart';
import 'package:weather/presentation/home/widgets/home_weathers.dart';
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
    final bloc = Provider.of<HomeBLoC>(context, listen: false);
    return ValueListenableBuilder<List<City>>(
      valueListenable: bloc.cities,
      child: const HomeEmpty(),
      builder: (_, cities, child) => AnimatedSwitcher(
        duration: const Duration(milliseconds: 500),
        child: (cities.isEmpty) ? child : const HomeWeathers(),
      ),
    );
  }
}
