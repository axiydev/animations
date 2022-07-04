import 'package:animations/consts/app_assets.dart';
import 'package:flutter/material.dart';

class AnimationsPage extends StatefulWidget {
  static const String path = '/animations_page';
  const AnimationsPage({super.key});

  @override
  State<AnimationsPage> createState() => _AnimationsPageState();
}

class _AnimationsPageState extends State<AnimationsPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Tween<Offset> _myTween;
  late Animation<Offset>? _animation;
  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    _myTween =
        Tween<Offset>(begin: const Offset(0, 0), end: const Offset(1, 0));
    _animation = _myTween
        .animate(CurvedAnimation(parent: _controller, curve: Curves.easeIn));
    _controller.addStatusListener((status) {
      if (_controller.status == AnimationStatus.completed) {
        _controller.reverse();
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
            child: SlideTransition(
          position: _animation!,
          child: Image.asset(MyImages.wild),
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
