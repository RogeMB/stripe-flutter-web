import 'package:flutter/material.dart';

Route navigatorFadeIn(BuildContext context, Widget page) {
  return PageRouteBuilder(
      pageBuilder: (_, __, ___) => page,
      transitionDuration: const Duration(milliseconds: 400),
      transitionsBuilder: (context, animation, _, child) {
        return FadeTransition(
            opacity:
                Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
              parent: animation,
              curve: Curves.easeInOutQuad,
            )),
            child: child);
      });
}
