import 'package:flutter/material.dart';

import 'spinning_animation.dart';

class PersonalizedScaffold extends StatelessWidget {
  const PersonalizedScaffold({
    super.key,
    required this.body,
    this.gradient,
    this.spinningAnimationColors,
  });

  final Widget body;
  final Gradient? gradient;
  final SpinningAnimationColors? spinningAnimationColors;

  @override
  Widget build(BuildContext context) {
    final scaffold = Scaffold(
      body: body,
      backgroundColor: _getBackgroundColor(),
    );

    if (spinningAnimationColors != null) {
      return SpinningAnimation(
        colors: spinningAnimationColors!,
        child: scaffold,
      );
    } else if (gradient != null) {
      return DecoratedBox(
        decoration: BoxDecoration(gradient: gradient!),
        child: scaffold,
      );
    } else {
      return scaffold;
    }
  }

  Color? _getBackgroundColor() {
    if (gradient != null || spinningAnimationColors != null) {
      return Colors.transparent;
    }

    return null;
  }
}
