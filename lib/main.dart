/*
Created by Axmadjon Isaqov on 14:17:17 04.07.2022
© 2022 
*/
///[@axi_dev]
///Mavzu: Animations
import 'package:animations/pages/advance_animations_page/advance_animations_page.dart';
import 'package:animations/pages/animated_wid/animated_wid_page.dart';
import 'package:animations/pages/animations_page/animations_page.dart';
import 'package:animations/pages/avarage_animations_page/avarage_animations_page.dart';
import 'package:animations/pages/basic_animations_page.dart';
import 'package:animations/pages/blur_page/blur_page.dart';
import 'package:animations/pages/bounce_animation/bounce_animation_page.dart';
import 'package:animations/pages/hinge/hinge_page.dart';
import 'package:animations/pages/three_flip/three_flip_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      routes: {
        BasicAnimationsPage.path: (context) => const BasicAnimationsPage(),
        AvarageAnimationsPage.path: (context) => const AvarageAnimationsPage(),
        AdvanceAnimationsPage.path: (context) => const AdvanceAnimationsPage(),
        AnimationsPage.path: (context) => const AnimationsPage(),
        BounceAnimationPage.path: (context) => const BounceAnimationPage(),
        ThreeDFlipPage.path: (context) => const ThreeDFlipPage(),
        HingeAnimationsPage.path: (context) => const HingeAnimationsPage(),
        BlurPage.path: (context) => BlurPage.show!,
        CustomAnimatedPage.path: (context) => const CustomAnimatedPage()
      },
      initialRoute: CustomAnimatedPage.path,
    );
  }
}
