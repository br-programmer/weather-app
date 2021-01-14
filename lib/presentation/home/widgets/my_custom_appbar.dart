import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather/domain/model/city.dart';
import 'package:weather/presentation/common/custom_search_delegate.dart';
import 'package:weather/presentation/home/home_bloc.dart';

class MyCustomAppBar extends StatelessWidget {
  const MyCustomAppBar({Key key}) : super(key: key);

  void _onTap(BuildContext context) async {
    final city = await showSearch<City>(context: context, delegate: CustomSearchDelegate());
    if (city != null) {
      Provider.of<HomeBLoC>(context, listen: false).addMyCity(city);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () => _onTap(context),
                child: Icon(Icons.add, color: Colors.white),
              ),
              Icon(Icons.more_vert, color: Colors.white),
            ],
          ),
        ),
      ),
    );
  }
}
