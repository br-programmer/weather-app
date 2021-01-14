import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather/presentation/common/page_indicator_painter.dart';
import 'package:weather/presentation/home/home_bloc.dart';

class PageIndicator extends StatelessWidget {
  const PageIndicator({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of<HomeBLoC>(context, listen: false);
    return SafeArea(
      child: Align(
        alignment: Alignment.topCenter,
        child: Container(
          height: kToolbarHeight * 1.25,
          alignment: Alignment.bottomCenter,
          child: AnimatedBuilder(
            animation: Listenable.merge([bloc.controller, bloc.myCities]),
            builder: (_, __) => CustomPaint(
              painter: PageIndicatorPainter(
                pageCount: bloc.myCities.value.length,
                scrollPosition:
                    (bloc.controller.hasClients && bloc.controller.page != null) ? bloc.controller.page : 0.0,
                dotRadius: 4.5,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
