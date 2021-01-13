import 'package:flutter/material.dart';
import 'package:weather/presentation/common/custom_search_delegate.dart';

class MyCustomAppBar extends StatelessWidget {
  const MyCustomAppBar({Key key}) : super(key: key);

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
                onTap: () => showSearch(context: context, delegate: CustomSearchDelegate()),
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
