import 'package:deepcare/core/extensions/context.dart';
import 'package:deepcare/core/extensions/text_style.dart';
import 'package:flutter/material.dart';

class NumberWidget extends StatefulWidget {
  const NumberWidget({super.key, required this.number});

  final int number;

  @override
  State<NumberWidget> createState() => _NumberWidgetState();
}

class _NumberWidgetState extends State<NumberWidget>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );
    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final number = widget.number.toString();
    final style = context.textTheme.displayMedium?.bold.copyWith(fontSize: 100);

    return AnimatedBuilder(
      animation: _fadeAnimation,
      builder: (context, child) {
        return Opacity(opacity: _fadeAnimation.value, child: child);
      },
      child: Stack(
        children: [
          Text(number, style: style),
          Transform.translate(
            offset: const Offset(-2, -2),
            child: Text(
              number,
              style: style?.copyWith(color: context.colorScheme.primary),
            ),
          ),
        ],
      ),
    );
  }
}
