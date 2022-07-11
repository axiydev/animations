import 'package:animations/wids/custom_animated.dart';
import 'package:flutter/material.dart';

class CustomAnimatedPage extends StatefulWidget {
  static const String path = '/custom_animated_page';
  const CustomAnimatedPage({super.key});

  @override
  State<CustomAnimatedPage> createState() => _CustomAnimatedPageState();
}

class _CustomAnimatedPageState extends State<CustomAnimatedPage>
    with TickerProviderStateMixin {
  AnimationController? _animationController;
  @override
  void initState() {
    _animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 10));
    _animationController!.repeat();
    super.initState();
  }

  @override
  void dispose() {
    _animationController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CustomAnimatedWidget(
          animation: _animationController!,
          child: const CustomWid(),
        ),
      ),
    );
  }
}

class CustomWid extends StatelessWidget {
  const CustomWid({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: 200,
      color: Colors.red,
    );
  }
}
