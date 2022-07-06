import 'dart:async';
import 'dart:math';

import 'package:animations/consts/app_assets.dart';
import 'package:flutter/material.dart';

//Bounce
class ThreeDFlipPage extends StatefulWidget {
  static const String path = '/three_d_page';
  const ThreeDFlipPage({super.key});

  @override
  State<ThreeDFlipPage> createState() => _ThreeDFlipPageState();
}

class _ThreeDFlipPageState extends State<ThreeDFlipPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double?> _animation;
  late Tween<double?> _tween;
  late Stream<int> myStram;
  double _x = 0;
  final timer = Stopwatch();
  DateTime _startTime = DateTime.now();
  DateTime _currentTime = DateTime.now();
  late Size? size;
  int millisecond = 0;
  @override
  void initState() {
    _animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    _tween = Tween<double>(begin: 0, end: pi);
    _animation = _tween.animate(
        CurvedAnimation(parent: _animationController, curve: Curves.easeIn));
    _animation.addStatusListener((status) {
      if (status == AnimationStatus.forward) {
        setState(() {
          _startTime = DateTime.now();
          _currentTime = DateTime.now();
        });
      }
    });
    _animationController.addListener(() {
      if (_animation.value == pi) {
        setState(() {});
      } else if (_animation.value == 0) {
        setState(() {
          _startTime = DateTime.now();
          _currentTime = DateTime.now();
        });
      }
      _currentTime = DateTime.now();

      millisecond = _currentTime.difference(_startTime).inMilliseconds;
      setState(() {});
    });
    super.initState();
  }

  @override
  void didChangeDependencies() {
    size = MediaQuery.of(context).size;
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _animation.removeListener(() {});
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: AnimatedBuilder(
                  animation: _animation,
                  builder: (context, child) {
                    return Transform(
                      transform: Matrix4.rotationY(_animation.value!),
                      alignment: Alignment.center,
                      child: Image.asset(
                        MyImages.wild,
                        width: 200,
                        height: 200,
                        fit: BoxFit.cover,
                      ),
                    );
                  }),
            ),
            AnimatedBuilder(
                animation: _animation,
                builder: (context, child) {
                  return Slider(
                    value: _animation.value!,
                    min: 0,
                    max: pi,
                    onChanged: (value) {
                      setState(() {
                        _x = value;
                      });
                    },
                  );
                }),
            Text(
              millisecond.toString(),
              style: const TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.play_arrow),
        onPressed: () {
          _animationController.status == AnimationStatus.completed
              ? _animationController.reverse()
              : _animationController.forward();
        },
      ),
    );
  }
}
