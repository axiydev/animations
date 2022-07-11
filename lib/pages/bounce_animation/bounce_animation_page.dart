import 'package:animations/consts/app_assets.dart';
import 'package:flutter/material.dart';

//Bounce
class BounceAnimationPage extends StatefulWidget {
  static const String path = '/bounce_animation_page';
  const BounceAnimationPage({super.key});

  @override
  State<BounceAnimationPage> createState() => _BounceAnimationPageState();
}

class _BounceAnimationPageState extends State<BounceAnimationPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Tween<Size> _myTween;
  // late Tween<double> _myOtherTween;
  late Animation<Size>? _animation;

  @override
  void initState() {
    super.initState();
    // loadData();
    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));

    _myTween =
        Tween<Size>(begin: const Size(10, 10), end: const Size(200, 100));
    _animation = _myTween.animate(CurvedAnimation(
        parent: _controller,
        curve: const Interval(0, 1, curve: Curves.bounceOut)));

    _controller.addStatusListener((status) {
      // if (_controller.status == AnimationStatus.completed) {
      //   _controller.reverse();
      // }
    });
    // _controller.addListener(() {
    //   if (_animation!.value < 190 && _animation!.value > 170) {
    //     log('value-->${_animation!.value}');
    //   }
    // });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Center(
            child: AnimatedBuilder(
          animation: _controller,
          builder: (context, child) => Container(
              padding: EdgeInsets.only(
                  bottom: _animation!.value.width,
                  right: _animation!.value.height),
              child: Image.asset(
                MyImages.wild,
                width: 100,
              )),
        )),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _controller.status == AnimationStatus.completed
              ? _controller.reverse()
              : _controller.forward();
          // _controller.forward();
        },
        child: const Icon(Icons.play_arrow),
      ),
    );
  }
}
