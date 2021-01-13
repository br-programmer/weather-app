import 'dart:async';

import 'package:flutter/material.dart';

class Debounce {
  final Duration duration;
  Timer _timer;

  Debounce({this.duration = const Duration(milliseconds: 800)});

  create(VoidCallback cb) {
    cancel();
    _timer = Timer(this.duration, cb);
  }

  cancel() {
    _timer?.cancel();
  }
}
