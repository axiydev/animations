import 'package:animations/consts/app_assets.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class AvarageAnimationsPage extends StatefulWidget {
  static const path = '/avarage_animations_page';
  const AvarageAnimationsPage({super.key});

  @override
  State<AvarageAnimationsPage> createState() => _AvarageAnimationsPageState();
}

class _AvarageAnimationsPageState extends State<AvarageAnimationsPage> {
  late Map _args;
  @override
  void didChangeDependencies() {
    _args = ModalRoute.of(context)!.settings.arguments as Map;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Center(
            child: Lottie.asset(MyAnimation.lost_connection, width: 200)),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        label: Text(_args['args'] ?? 'hello'),
      ),
    );
  }
}


//animations
//flutter_hooks
//flutter_staggered_animations