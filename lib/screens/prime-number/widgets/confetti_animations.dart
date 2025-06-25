import 'package:deepcare/core/extensions/context.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class ConfettiAnimations extends StatelessWidget {
  const ConfettiAnimations({super.key});

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: const Offset(-2, 0),
      child: IgnorePointer(
        ignoring: true,
        child: Lottie.asset(
          'assets/animations/confetti.json',
          fit: BoxFit.cover,
          repeat: false,
          width: context.width,
        ),
      ),
    );
  }
}
