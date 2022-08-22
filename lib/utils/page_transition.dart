import 'package:flutter/material.dart';

class PageTransition extends PageRouteBuilder {
  final Widget widget;

  PageTransition({Key? key, required this.widget})
      : super(
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) =>
              widget,
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) =>
              SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(1, 0),
              end: const Offset(0, 0),
            ).animate(animation),
            child: child,
          ),
          transitionDuration: const Duration(
            milliseconds: 300,
          ),
        );
}
