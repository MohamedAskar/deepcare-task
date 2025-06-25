import 'package:deepcare/core/extensions/context.dart';
import 'package:deepcare/core/extensions/text_style.dart';
import 'package:deepcare/utils/color_service.dart';
import 'package:flex_color_picker/flex_color_picker.dart';
import 'package:flutter/material.dart';

class MainColorSection extends StatelessWidget {
  const MainColorSection({
    super.key,
    required this.currentColor,
    required this.onColorChanged,
  });

  final Color currentColor;
  final ValueChanged<Color> onColorChanged;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(context.l10n.mainColor),
      titleTextStyle: context.textTheme.titleMedium?.bold,
      subtitle: Text('Personalize app with your color'),
      trailing: ColorIndicator(color: currentColor),
      onTap: () async {
        final result = await ColorService.showColorPicker(
          context,
          currentColor,
        );
        onColorChanged(result);
      },
    );
  }
}
