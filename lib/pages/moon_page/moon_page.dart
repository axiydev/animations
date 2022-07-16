import 'package:animations/consts/app_assets.dart';
import 'package:flutter/material.dart';

class MoonPage extends StatefulWidget {
  static const String path = '/moon_page';
  const MoonPage({super.key});

  @override
  State<MoonPage> createState() => _MoonPageState();
}

class _MoonPageState extends State<MoonPage> with TickerProviderStateMixin {
  late AnimationController? _animationController;
  late Animation<Offset?> _animationSun;
  late Animation<Offset?> _endAnimation;
  late Tween<Offset?> _beginOffset;
  late Tween<Offset?> _endOffset;
  MediaQueryData? _mediaQueryData;

  @override
  void didChangeDependencies() {
    _mediaQueryData = MediaQuery.of(context);
    _beginOffset = Tween<Offset>(
        begin: Offset(_mediaQueryData!.size.width / 2 - 50, 0),
        end: Offset(_mediaQueryData!.size.width, 0));
    _endOffset = Tween<Offset>(
        begin: const Offset(-100, 0),
        end: Offset(_mediaQueryData!.size.width / 2 - 50, 0));

    _animationSun = _beginOffset.animate(
        CurvedAnimation(parent: _animationController!, curve: Curves.bounceIn));
    _endAnimation = _endOffset.animate(CurvedAnimation(
        parent: _animationController!, curve: Curves.bounceOut));
    super.didChangeDependencies();
  }

  @override
  void initState() {
    _animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            AnimatedBuilder(
              animation: _animationSun,
              builder: (context, child) => Transform.translate(
                offset: _animationSun.value!,
                child: Image.asset(
                  MyImages.sunny,
                  width: 100,
                ),
              ),
            ),
            AnimatedBuilder(
                animation: _endAnimation,
                builder: (context, child) {
                  return Transform.translate(
                    offset: _endAnimation.value!,
                    child: Image.asset(
                      MyImages.moon,
                      width: 100,
                    ),
                  );
                }),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _animationController!.forward();
        },
        child: const Icon(Icons.play_arrow),
      ),
    );
  }
}
