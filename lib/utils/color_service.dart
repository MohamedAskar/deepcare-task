import 'package:deepcare/core/extensions/context.dart';
import 'package:deepcare/core/extensions/text_style.dart';
import 'package:flex_color_picker/flex_color_picker.dart';
import 'package:flutter/material.dart';

class ColorService {
  static String toHex(Color color) {
    return '#${color.toARGB32().toRadixString(16).padLeft(8, '0')}';
  }

  static Color fromHex(String hex) {
    if (hex.startsWith('#')) {
      hex = hex.substring(1);
    }

    if (hex.length == 6) {
      hex = 'FF$hex';
    }

    return Color(int.parse(hex, radix: 16));
  }

  static Future<Color> showColorPicker(
    BuildContext context,
    Color color,
  ) async {
    final result = await showColorPickerDialog(
      context,
      color,
      title: Text('Choose Color', style: context.textTheme.titleMedium?.bold),
      actionsPadding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      columnSpacing: 16,
      pickersEnabled: {
        ColorPickerType.wheel: true,
        ColorPickerType.primary: false,
        ColorPickerType.accent: false,
      },
      enableShadesSelection: false,
      wheelSquarePadding: 8,
      wheelSquareBorderRadius: 4,
    );
    return result;
  }
}
