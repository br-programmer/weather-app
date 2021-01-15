import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class IconSwiperUp extends StatefulWidget {
  const IconSwiperUp({Key key}) : super(key: key);

  @override
  _IconSwiperUpState createState() => _IconSwiperUpState();
}

class _IconSwiperUpState extends State<IconSwiperUp> with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation<Offset> offset;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1300),
    );
    offset = Tween<Offset>(begin: Offset.zero, end: Offset(0.0, -0.2))
        .animate(CurvedAnimation(parent: _controller, curve: Curves.bounceIn));
    _controller.repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  void _onVerticalDragUpdate(DragUpdateDetails details) {
    if (details.primaryDelta > -12) {
      showCupertinoModalPopup(
        context: context,
        builder: (_) => Container(
          color: Colors.red.withOpacity(.2),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onVerticalDragUpdate: _onVerticalDragUpdate,
      child: Container(
        height: kToolbarHeight * .75,
        alignment: Alignment.center,
        child: AnimatedBuilder(
          animation: _controller,
          child: Icon(Icons.keyboard_arrow_up, color: Colors.white, size: 40),
          builder: (_, child) => SlideTransition(position: offset, child: child),
        ),
      ),
    );
  }
}
