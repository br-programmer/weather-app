import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather/domain/model/city.dart';
import 'package:weather/presentation/common/my_loading.dart';
import 'package:weather/presentation/home/home_bloc.dart';
import 'package:weather/presentation/home/widgets/widgets.dart' show MyCustomAppBar, HomeEmpty, HomeWeathers;

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          const _Body(),
          const MyCustomAppBar(),
          const _LoadingWeathers(),
        ],
      ),
    );
  }
}

class _LoadingWeathers extends StatelessWidget {
  const _LoadingWeathers({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of<HomeBLoC>(context, listen: false);
    return ValueListenableBuilder<bool>(
      valueListenable: bloc.loadingWeathers,
      child: Container(color: Colors.transparent, child: const MyLoading()),
      builder: (_, value, child) => value ? child : const SizedBox.shrink(),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of<HomeBLoC>(context, listen: false);
    return Positioned.fill(
      child: ValueListenableBuilder<List<City>>(
        valueListenable: bloc.myCities,
        child: const HomeEmpty(),
        builder: (_, cities, child) => AnimatedSwitcher(
          duration: const Duration(milliseconds: 500),
          child: (cities.isEmpty) ? child : const HomeWeathers(),
        ),
      ),
    );
  }
}
