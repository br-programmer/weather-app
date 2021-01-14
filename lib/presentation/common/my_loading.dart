import 'package:flutter/material.dart';
import 'package:vector_math/vector_math.dart' as vector;

class MyLoading extends StatefulWidget {
  const MyLoading({Key key}) : super(key: key);

  @override
  _MyLoadingState createState() => _MyLoadingState();
}

class _MyLoadingState extends State<MyLoading> with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation _animation;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    )..repeat();
    _animation = CurvedAnimation(curve: Curves.fastOutSlowIn, parent: _controller);
    super.initState();
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: FractionallySizedBox(
        widthFactor: .09,
        child: AnimatedBuilder(
          animation: _animation,
          child: Image.asset('assets/brand/loading.png'),
          builder: (_, child) => Transform.rotate(angle: vector.radians(180 * _controller.value), child: child),
        ),
      ),
    );
  }
}
