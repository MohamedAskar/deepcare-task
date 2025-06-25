import 'dart:math';

import 'package:deepcare/core/extensions/context.dart';
import 'package:flutter/material.dart';

class SpinningAnimation extends StatefulWidget {
  const SpinningAnimation({
    super.key,
    required this.child,
    required this.colors,
  });

  final Widget child;
  final SpinningAnimationColors colors;

  @override
  State<SpinningAnimation> createState() => _SpinningAnimationState();
}

class _SpinningAnimationState extends State<SpinningAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 20),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final minDimension = min(context.width, context.height) * 0.8;
    final gradientSize = minDimension / 1.5;
    final maxDimension = 2 * max(context.width, context.height);

    final topLeftColor = widget.colors.topLeftColor;
    final topRightColor = widget.colors.topRightColor;
    final bottomLeftColor = widget.colors.bottomLeftColor;
    final bottomRightColor = widget.colors.bottomRightColor;

    final startOpacity = widget.colors.startOpacity;
    final endOpacity = widget.colors.endOpacity;

    return Stack(
      fit: StackFit.expand,
      children: [
        ColoredBox(color: context.colorScheme.surface),
        RepaintBoundary(
          child: Center(
            child: Transform.scale(
              scale: maxDimension / minDimension,
              child: RotationTransition(
                turns: _controller,
                child: Stack(
                  children: [
                    if (topLeftColor != null)
                      Positioned(
                        top: 0,
                        left: 0,
                        child: GradientBox(
                          color: topLeftColor,
                          gradientSize: gradientSize,
                          startOpacity: startOpacity,
                          endOpacity: endOpacity,
                        ),
                      ),
                    if (bottomRightColor != null)
                      Positioned(
                        right: 0,
                        bottom: 0,
                        child: GradientBox(
                          color: bottomRightColor,
                          gradientSize: gradientSize,
                          startOpacity: startOpacity,
                          endOpacity: endOpacity,
                        ),
                      ),
                    if (bottomLeftColor != null)
                      Positioned(
                        left: 0,
                        bottom: 0,
                        child: GradientBox(
                          color: bottomLeftColor,
                          gradientSize: gradientSize,
                          startOpacity: startOpacity,
                          endOpacity: endOpacity,
                        ),
                      ),
                    if (topRightColor != null)
                      Positioned(
                        top: 0,
                        right: 0,
                        child: GradientBox(
                          color: topRightColor,
                          gradientSize: gradientSize,
                          startOpacity: startOpacity,
                          endOpacity: endOpacity,
                        ),
                      ),
                    SizedBox.square(dimension: minDimension),
                  ],
                ),
              ),
            ),
          ),
        ),
        widget.child,
      ],
    );
  }
}

class GradientBox extends StatelessWidget {
  const GradientBox({
    super.key,
    required this.color,
    required this.gradientSize,
    required this.startOpacity,
    required this.endOpacity,
  });

  final Color color;
  final double gradientSize;
  final double startOpacity;
  final double endOpacity;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        gradient: RadialGradient(
          colors: [
            color.withValues(alpha: startOpacity),
            color.withValues(alpha: endOpacity),
          ],
        ),
      ),
      child: SizedBox.square(dimension: gradientSize),
    );
  }
}

class SpinningAnimationColors {
  const SpinningAnimationColors({
    this.topLeftColor,
    this.topRightColor,
    this.bottomLeftColor,
    this.bottomRightColor,
    this.startOpacity = 0.5,
    this.endOpacity = 0,
  });

  final Color? topLeftColor;
  final Color? topRightColor;
  final Color? bottomLeftColor;
  final Color? bottomRightColor;
  final double startOpacity;
  final double endOpacity;
}
