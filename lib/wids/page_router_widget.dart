import 'package:flutter/material.dart';

class PageRouterWidget extends PageRouteBuilder {
  final Widget wid;
  PageRouterWidget({required this.wid})
      : super(
            pageBuilder: (context, animation, secondaryAnimation) => wid,
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) => Align(
                      child: SizeTransition(
                        sizeFactor: animation,
                        child: child,
                      ),
                    ),
            transitionDuration: const Duration(seconds: 5));
}
