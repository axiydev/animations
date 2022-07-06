import 'dart:math';

import 'package:animations/consts/app_assets.dart';
import 'package:flutter/material.dart';

class HingeAnimationsPage extends StatefulWidget {
  static const String path = '/hinge_animations_page';
  const HingeAnimationsPage({super.key});

  @override
  State<HingeAnimationsPage> createState() => _HingeAnimationsPageState();
}

class _HingeAnimationsPageState extends State<HingeAnimationsPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Tween<double> _myTween;
  late Tween<Offset> _offsetTween;
  late Tween<double> _opacityTween;
  late Animation<double>? _animation;
  late Animation<Offset?> _animationOffeset;
  late Animation<double?> _animationOpacity;
  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 10));
    _myTween = Tween<double>(begin: 0, end: pi);
    _offsetTween =
        Tween<Offset>(begin: const Offset(0, 0), end: const Offset(0, 100));
    _opacityTween = Tween<double>(begin: 0, end: 1.0);

    _animation = _myTween
        .animate(CurvedAnimation(parent: _controller, curve: Curves.bounceIn));

    _animationOffeset = _offsetTween
        .animate(CurvedAnimation(parent: _controller, curve: Curves.easeIn));
    _animationOpacity = _opacityTween
        .animate(CurvedAnimation(parent: _controller, curve: Curves.ease));
    _controller.addStatusListener((status) {
      if (_controller.status == AnimationStatus.completed) {
        _controller.reverse();
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: AnimatedBuilder(
              animation: _animation!,
              builder: (context, child) => Transform(
                  transform: Matrix4.rotationY(_animation!.value),
                  alignment: Alignment.center,
                  child: AnimatedBuilder(
                      animation: _animationOffeset,
                      builder: (context, child) => Transform.translate(
                            offset: _animationOffeset.value!,
                            child: AnimatedBuilder(
                                animation: _animationOpacity,
                                builder: (context, child) {
                                  return Opacity(
                                    opacity: _animationOpacity.value!,
                                    child: Image.asset(
                                      MyImages.wild,
                                      width: 100,
                                    ),
                                  );
                                }),
                          )))),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _controller.status == AnimationStatus.completed
              ? _controller.reverse()
              : _controller.forward();
        },
        child: const Icon(Icons.play_arrow),
      ),
    );
  }
}
