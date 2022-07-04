import 'package:animations/consts/app_assets.dart';
import 'package:flutter/material.dart';

class AdvanceAnimationsPage extends StatefulWidget {
  static const String path = '/advance_animations_page';
  const AdvanceAnimationsPage({super.key});

  @override
  State<AdvanceAnimationsPage> createState() => _AdvanceAnimationsPageState();
}

class _AdvanceAnimationsPageState extends State<AdvanceAnimationsPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Tween<double> _myTween;
  late Animation<double>? _animation;
  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    _myTween = Tween<double>(begin: 0.5, end: 1.0);
    _animation = _myTween
        .animate(CurvedAnimation(parent: _controller, curve: Curves.bounceIn));
    _controller.addStatusListener((status) {
      if (_controller.status == AnimationStatus.completed) {
        _controller.repeat();
      }
    });
    _controller.forward();
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
          builder: (context, child) =>
              Transform.scale(scale: _animation!.value, child: child),
          child: Image.asset(
            MyImages.wild,
          ),
        )),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // _controller.status == AnimationStatus.completed
          //     ? _controller.reverse()
          //     : _controller.forward();
        },
        child: const Icon(Icons.play_arrow),
      ),
    );
  }
}
