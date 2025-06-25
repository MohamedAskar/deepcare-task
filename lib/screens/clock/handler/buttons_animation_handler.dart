import 'dart:async';

import 'package:flutter/material.dart';

class ButtonsAnimationHandler extends StatefulWidget {
  const ButtonsAnimationHandler({super.key, required this.builder});

  final Widget Function(BuildContext context, Animation<double> opacity)
  builder;

  @override
  State<ButtonsAnimationHandler> createState() =>
      _ButtonsAnimationHandlerState();
}

class _ButtonsAnimationHandlerState extends State<ButtonsAnimationHandler>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _opacity;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _opacity = Tween<double>(begin: 1.0, end: 0.0).animate(_controller);

    _initHideTimer();
  }

  void hideButtons() {
    _controller.forward();
    _timer?.cancel();
  }

  void _initHideTimer() {
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 8), (timer) {
      hideButtons();
    });
  }

  void toggleButtons() {
    if (_opacity.value > 0.5) {
      _controller.forward();
    } else {
      _controller.reverse();
    }
    _timer?.cancel();
  }

  @override
  void dispose() {
    _controller.dispose();
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: toggleButtons,
      behavior: HitTestBehavior.translucent,
      child: widget.builder(context, _opacity),
    );
  }
}
