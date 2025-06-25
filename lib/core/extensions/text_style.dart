import 'package:flutter/material.dart';

extension TextStyleExtension on TextStyle {
  TextStyle get bold => copyWith(fontWeight: FontWeight.bold);

  TextStyle get semibold => copyWith(fontWeight: FontWeight.w500);
}
