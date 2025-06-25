import 'package:deepcare/core/extensions/context.dart';
import 'package:deepcare/core/extensions/text_style.dart';
import 'package:flutter/material.dart';

class AnimationToggleSection extends StatelessWidget {
  const AnimationToggleSection({
    super.key,
    required this.animated,
    this.onToggle,
  });

  final bool animated;
  final ValueChanged<bool>? onToggle;
  @override
  Widget build(BuildContext context) {
    return SwitchListTile(
      title: Text(
        'Animated Background',
        style: context.textTheme.titleMedium?.bold,
      ),
      subtitle: Text('Background will be smoothly animated'),
      value: animated,
      onChanged: onToggle,
    );
  }
}
