import 'package:deepcare/l10n/generated/app_localizations.dart';
import 'package:flutter/material.dart';

extension ContextExtension on BuildContext {
  ThemeData get theme => Theme.of(this);

  ColorScheme get colorScheme => theme.colorScheme;

  TextTheme get textTheme => theme.textTheme;

  AppLocalizations get l10n => AppLocalizations.of(this)!;

  Size get screenSize => MediaQuery.sizeOf(this);

  double get width => screenSize.width;

  double get height => screenSize.height;
}
