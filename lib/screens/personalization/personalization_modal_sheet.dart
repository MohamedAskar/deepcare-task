import 'package:deepcare/core/extensions/context.dart';
import 'package:deepcare/core/extensions/text_style.dart';
import 'package:deepcare/core/models/personalization_settings.dart';
import 'package:deepcare/utils/color_service.dart';
import 'package:deepcare/utils/personalization_controller_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'widgets/animation_toggle_section.dart';
import 'widgets/gradient_colors_section.dart';
import 'widgets/main_color_section.dart';

class PersonalizationModalSheet extends ConsumerStatefulWidget {
  const PersonalizationModalSheet({super.key});

  @override
  ConsumerState<PersonalizationModalSheet> createState() =>
      _PersonalizationModalSheetState();
}

class _PersonalizationModalSheetState
    extends ConsumerState<PersonalizationModalSheet> {
  late final ValueNotifier<Color> mainColor;
  late final ValueNotifier<List<Color>> gradientColors;
  late final ValueNotifier<bool> animated;

  @override
  void initState() {
    super.initState();
    final settings = ref.read(personalizationControllerProvider);
    mainColor = ValueNotifier(settings.mainColor);
    gradientColors = ValueNotifier(settings.gradientColors);
    animated = ValueNotifier(settings.animated);
  }

  void _onResetToDefaults() {
    final settings = ref.read(personalizationControllerProvider);
    mainColor.value = settings.mainColor;
    gradientColors.value = settings.gradientColors;
    animated.value = settings.animated;
  }

  void _onSaveChanges() {
    final mainColorHex = ColorService.toHex(mainColor.value);
    final gradientColorsHex = gradientColors.value
        .map((color) => ColorService.toHex(color))
        .toList();

    final settings = PersonalizationSettings(
      mainHexColor: mainColorHex,
      gradientHexColors: gradientColorsHex,
      animated: gradientColorsHex.length >= 2 ? animated.value : true,
    );
    ref
        .read(personalizationControllerProvider.notifier)
        .updateSettings(settings);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              context.l10n.personalizationSheetTitle,
              style: context.textTheme.headlineMedium?.bold,
            ),
          ),
          const SizedBox(height: 24),
          ValueListenableBuilder(
            valueListenable: mainColor,
            builder: (context, value, child) {
              return MainColorSection(
                currentColor: value,
                onColorChanged: (color) => mainColor.value = color,
              );
            },
          ),
          const SizedBox(height: 12),

          ValueListenableBuilder(
            valueListenable: gradientColors,
            builder: (context, value, child) {
              return GradientColorsSection(
                gradientColors: value,
                onColorsChanged: (colors) {
                  gradientColors.value = colors;
                },
              );
            },
          ),
          const SizedBox(height: 12),
          ValueListenableBuilder(
            valueListenable: gradientColors,
            builder: (context, value, child) {
              if (value.isEmpty) {
                return const SizedBox.shrink();
              }

              if (value.length < 2) {
                return AnimationToggleSection(animated: true);
              }

              return ValueListenableBuilder(
                valueListenable: animated,
                builder: (context, value, child) {
                  return AnimationToggleSection(
                    animated: value,
                    onToggle: (value) => animated.value = value,
                  );
                },
              );
            },
          ),
          const SizedBox(height: 12),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Row(
              spacing: 8,
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: _onResetToDefaults,
                    child: Text(context.l10n.resetToDefaults),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: FilledButton(
                    onPressed: _onSaveChanges,
                    child: Text(context.l10n.saveChanges),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
