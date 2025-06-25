import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:deepcare/core/extensions/context.dart';
import 'package:deepcare/l10n/generated/app_localizations.dart';
import 'package:deepcare/utils/theme_controller_provider.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

class ThemeSwitcherButton extends ConsumerWidget {
  const ThemeSwitcherButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final currentTheme = ref.watch(themeControllerProvider);
    final themeController = ref.read(themeControllerProvider.notifier);

    return PopupMenuButton<ThemeMode>(
      // padding: EdgeInsets.zero,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      onSelected: (ThemeMode mode) async {
        await themeController.setThemeMode(mode);
      },
      itemBuilder: (BuildContext context) {
        return ThemeMode.values
            .map(
              (mode) => PopupMenuItem<ThemeMode>(
                value: mode,
                child: ListTile(
                  leading: Icon(_getThemeIcon(mode)),
                  title: Text(l10n.themeMode(mode.name)),
                  selected: mode == currentTheme,
                  contentPadding: EdgeInsets.zero,
                ),
              ),
            )
            .toList();
      },
      icon: Icon(_getThemeIcon(currentTheme)),
      iconColor: context.colorScheme.onSurface,
    );
  }

  IconData _getThemeIcon(ThemeMode mode) {
    switch (mode) {
      case ThemeMode.light:
        return LucideIcons.sun;
      case ThemeMode.dark:
        return LucideIcons.moon;
      case ThemeMode.system:
        return LucideIcons.sunMoon;
    }
  }
}
