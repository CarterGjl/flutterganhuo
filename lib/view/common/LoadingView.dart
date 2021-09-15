import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoadingView extends StatelessWidget {

  bool loading = true;
  Widget? child;

  LoadingView({required this.loading, this.child});

  @override
  Widget build(BuildContext context) {
    if (loading) {
      return UnconstrainedBox(
        child: Container(child: CircularProgressIndicator()),
      );
    } else {
      if (child == null) {
        return Container();
      }
      return child!;
    }
  }
}
