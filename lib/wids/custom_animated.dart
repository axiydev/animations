import 'dart:math';
import 'package:flutter/material.dart';

class CustomAnimatedWidget extends AnimatedWidget {
  final Widget? child;
  const CustomAnimatedWidget(
      {Key? key, required this.child, required Animation<double> animation})
      : super(key: key, listenable: animation);

  Animation<double>? get _progress => listenable as Animation<double>;
  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: 2.0 * pi * _progress!.value,
      child: child,
    );
  }
}
