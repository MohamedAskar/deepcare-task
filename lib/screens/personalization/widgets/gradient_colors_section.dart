import 'package:deepcare/core/extensions/context.dart';
import 'package:deepcare/core/extensions/text_style.dart';
import 'package:deepcare/utils/color_service.dart';
import 'package:flex_color_picker/flex_color_picker.dart';
import 'package:flutter/material.dart';

class GradientColorsSection extends StatelessWidget {
  const GradientColorsSection({
    super.key,
    this.maxColors = 4,
    required this.gradientColors,
    required this.onColorsChanged,
  });

  final int maxColors;
  final List<Color> gradientColors;
  final ValueChanged<List<Color>> onColorsChanged;

  void _onColorChanged(Color color) {
    final index = gradientColors.indexOf(color);
    final newColors = [...gradientColors];
    newColors[index] = color;
    onColorsChanged(newColors);
  }

  void _onColorRemoved(Color color) {
    final newColors = gradientColors.where((c) => c != color).toList();
    onColorsChanged(newColors);
  }

  void _onAddColor(Color color) {
    final newColors = [...gradientColors, color];
    onColorsChanged(newColors);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        ListTile(
          title: Text('Background Colors'),
          titleTextStyle: context.textTheme.titleMedium?.bold,
          subtitle: Text('Personalize your clock background with your colors'),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Wrap(
            spacing: 8,
            runSpacing: 8,
            crossAxisAlignment: WrapCrossAlignment.end,
            children: [
              ...gradientColors.map(
                (color) => _ColorIndicator(
                  color: color,
                  onRemove: () => _onColorRemoved(color),
                  onColorChanged: _onColorChanged,
                ),
              ),
              if (gradientColors.length < maxColors)
                _AddColorButton(onAddColor: _onAddColor),
            ],
          ),
        ),
      ],
    );
  }
}

class _ColorIndicator extends StatelessWidget {
  const _ColorIndicator({
    required this.color,
    required this.onRemove,
    required this.onColorChanged,
  });

  final Color color;
  final VoidCallback onRemove;
  final ValueChanged<Color> onColorChanged;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 48,
      height: 48,
      child: Stack(
        alignment: Alignment.bottomLeft,
        children: [
          ColorIndicator(
            color: color,
            onSelect: () async {
              final newColor = await ColorService.showColorPicker(
                context,
                color,
              );
              onColorChanged(newColor);
            },
          ),
          Positioned(
            top: 0,
            right: 0,
            child: InkWell(
              onTap: onRemove,
              child: CircleAvatar(
                radius: 10,
                backgroundColor: context.colorScheme.onSurface,
                child: Icon(
                  Icons.close_rounded,
                  size: 16,
                  color: context.colorScheme.surface,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _AddColorButton extends StatelessWidget {
  const _AddColorButton({required this.onAddColor});

  final ValueChanged<Color> onAddColor;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        final newColor = await ColorService.showColorPicker(
          context,
          context.colorScheme.primary,
        );
        onAddColor(newColor);
      },
      borderRadius: BorderRadius.circular(10),
      child: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: context.colorScheme.outline, width: 2),
        ),
        child: const Icon(Icons.add_rounded),
      ),
    );
  }
}
