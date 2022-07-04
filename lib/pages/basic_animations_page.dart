import 'package:flutter/material.dart';

class BasicAnimationsPage extends StatefulWidget {
  static const path = '/basic_animations_page';
  const BasicAnimationsPage({super.key});

  @override
  State<BasicAnimationsPage> createState() => _BasicAnimationsPageState();
}

class _BasicAnimationsPageState extends State<BasicAnimationsPage> {
  late Size? size;
  double? width = 200;
  // late double? height = 200;
  Alignment align = Alignment.topLeft;
  late int? _counter;
  bool _isFirst = true;

  double? _elevation = 10;

  @override
  void initState() {
    _counter = 0;
    super.initState();
  }

  @override
  void didChangeDependencies() {
    size = MediaQuery.of(context).size;
    super.didChangeDependencies();
  }

  @override
  void didUpdateWidget(covariant BasicAnimationsPage oldWidget) {
    super.didUpdateWidget(oldWidget);
  }

  void _changeSize() {
    if (width == 200) {
      width = 300;
    } else if (width == 300) {
      width = 200;
    }
    setState(() {});
  }

  void _changeAlign() {
    if (align == Alignment.topLeft) {
      align = Alignment.bottomRight;
    } else {
      align = Alignment.topLeft;
    }
    setState(() {});
  }

  void _changePadding() {
    _isFirst = !_isFirst;
    setState(() {});
  }

  void _increment() {
    _counter = _counter! + 1;
    setState(() {});
  }

  void _changeElevation() {
    if (_elevation == 5) {
      _elevation = 30;
    } else {
      _elevation = 5;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SizedBox(
        height: size!.height,
        width: size!.width,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //animated align
            // AnimatedContainer(
            //   duration: const Duration(milliseconds: 1000),
            //   curve: Curves.easeIn,
            //   height: width,
            //   width: width,
            //   color: Colors.red,
            // ),
            ///animated align
            // SizedBox(
            //     height: size!.height - 100,
            //     width: size!.width,
            //     child: AnimatedAlign(
            //       alignment: align,
            //       duration: const Duration(milliseconds: 450),
            //       curve: Curves.bounceOut,
            //       child: GestureDetector(
            //         onTap: _changeAlign,
            //         child: Container(
            //           color: Colors.red,
            //           height: 100,
            //           width: 100,
            //         ),
            //       ),
            //     )),

            ///animated padding
            // InkWell(
            //   onTap: _changePadding,
            //   child: Container(
            //     // height: 100,
            //     // width: 100,
            //     color: Colors.green,
            //     child: AnimatedPadding(
            //       padding: EdgeInsets.all(_isFirst ? 0 : 50),
            //       duration: const Duration(
            //         milliseconds: 450,
            //       ),
            //       curve: Curves.easeIn,
            //       child: const SizedBox(
            //         height: 100,
            //         width: 100,
            //       ),
            //     ),
            //   ),
            // ),
            ///Animated crossFade
            // InkWell(
            //     onTap: _changePadding,
            //     child: AnimatedCrossFade(
            //         firstChild: Container(
            //           height: 100,
            //           width: 100,
            //           color: Colors.blue,
            //         ),
            //         sizeCurve: Curves.linear,
            //         reverseDuration: const Duration(milliseconds: 1000),
            //         secondChild: Container(
            //           color: Colors.red,
            //           width: 100,
            //           height: 100,
            //         ),
            //         firstCurve: Curves.easeIn,
            //         secondCurve: Curves.ease,
            //         crossFadeState: _isFirst
            //             ? CrossFadeState.showFirst
            //             : CrossFadeState.showSecond,
            //         // layoutBuilder:
            //         //     (topChild, topChildKey, bottomChild, bottomChildKey) =>
            //         //         _isFirst ? bottomChild : topChild,
            //         duration: const Duration(milliseconds: 450))),

            ///animated switcher

            AnimatedSwitcher(
              duration: const Duration(seconds: 1),
              switchInCurve: Curves.easeIn,
              switchOutCurve: Curves.easeInBack,
              transitionBuilder: (child, animation) => ScaleTransition(
                scale: animation,
                child: child,
              ),
              child: Text(
                '$_counter',
                key: ValueKey<int?>(_counter),
                style: const TextStyle(
                    fontSize: 70,
                    fontWeight: FontWeight.w600,
                    color: Colors.blue),
              ),
            ),

            ///Animated Opacity
            AnimatedOpacity(
              opacity: _isFirst ? 1 : 0,
              duration: const Duration(seconds: 1),
              child: const Text(
                'Salom Dunyo',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 70,
                    fontWeight: FontWeight.w600,
                    color: Colors.blue),
              ),
            ),

            AnimatedPhysicalModel(
                shape: BoxShape.circle,
                elevation: _elevation!,
                color: Colors.green,
                shadowColor: Colors.grey,
                duration: const Duration(seconds: 1),
                curve: Curves.easeIn,
                child: Container(
                  height: 80,
                  width: 80,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                ))
          ],
        ),
      )),
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            _increment();
            _changePadding();
            _changeElevation();
          },
          label: const Text('animate')),
    );
  }
}
