import 'package:flutter/cupertino.dart';

class Bottom2TopRouter<T> extends PageRouteBuilder<T> {
  final Widget child;
  final int durationMs;
  final Curve curve;

  Bottom2TopRouter({
    required this.child,
    this.durationMs = 500,
    this.curve = Curves.fastOutSlowIn})
      : super(
    transitionDuration: Duration(milliseconds: durationMs),
    transitionsBuilder: (ctx, a1, a2, child) => SlideTransition(
        child: child,
        position: Tween<Offset>(
            begin: const Offset(0.0, 1.0),
            end: const Offset(0.0, 0.0)
        ).animate(CurvedAnimation(parent: a1, curve: curve))),
    pageBuilder: (ctx, a1, a2) => child,
    opaque: false,
    fullscreenDialog: true,
  );
}