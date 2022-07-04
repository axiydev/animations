import 'package:animations/advance_animations_page/advance_animations_page.dart';
import 'package:animations/animations_page/animations_page.dart';
import 'package:animations/avarage_animations_page/avarage_animations_page.dart';
import 'package:animations/pages/basic_animations_page.dart';
/*
Created by Axmadjon Isaqov on 14:17:17 04.07.2022
© 2022 
*/
///[@axi_dev]
///Mavzu: Animations
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
        AnimationsPage.path: (context) => const AnimationsPage()
      },
      initialRoute: AnimationsPage.path,
    );
  }
}
