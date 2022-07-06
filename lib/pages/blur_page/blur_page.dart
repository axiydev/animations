import 'dart:ui';

import 'package:animations/consts/app_assets.dart';
import 'package:animations/pages/blur_page/blur_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

//blur effect in flutter
class BlurPage extends StatelessWidget {
  static const String path = '/blur_page';
  const BlurPage({super.key});
  static Widget? get show => ChangeNotifierProvider(
        create: (_) => BlurPageProvider(),
        child: const BlurPage(),
      );

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Consumer<BlurPageProvider>(
      builder: (context, providerValue, child) => child!,
      child: Scaffold(
        body: Container(
          height: size.height,
          width: size.width,
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
                  MyImages.wild,
                ),
                fit: BoxFit.cover),
          ),
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Card(
                  color: Colors.black.withOpacity(0.5),
                  elevation: 10,
                  margin: const EdgeInsets.all(0),
                  child: SizedBox(
                    height: 60,
                    width: size.width,
                    child: BackdropFilter(
                      blendMode: BlendMode.srcIn,
                      filter: ImageFilter.blur(
                          sigmaX: 10, sigmaY: -10, tileMode: TileMode.clamp),
                      child: const Center(
                          child: Text(
                        '\u{270c}  \u{1f919}',
                        style: TextStyle(fontSize: 30),
                      )),
                    ),
                  ),
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
