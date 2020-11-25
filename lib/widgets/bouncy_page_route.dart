import 'package:flutter/material.dart';

class BouncyPageRoute extends PageRouteBuilder {
  final Widget widget;
  BouncyPageRoute({this.widget})
      : super(
          transitionDuration: Duration(milliseconds: 900),
          transitionsBuilder: (BuildContext context,
              Animation<double> animation,
              Animation<double> secAnimation,
              Widget child) {
            animation =
                CurvedAnimation(parent: animation, curve: Curves.elasticInOut);
            return ScaleTransition(
              scale: animation,
              child: child,
            );
          },
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            secAnimation,
          ) {
            return widget;
          },
        );
}
