import 'package:flutter/cupertino.dart';

void navigateWithFade(BuildContext context, Widget destination, {int durationMs = 500}) {
  Navigator.of(context).push(PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => destination,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return FadeTransition(
        opacity: animation,
        child: child,
      );
    },
    transitionDuration: Duration(milliseconds: durationMs),
  ));
}
