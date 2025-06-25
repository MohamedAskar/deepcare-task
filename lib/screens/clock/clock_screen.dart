import 'package:deepcare/widgets/clock_display.dart';
import 'package:deepcare/widgets/personalization_button.dart';
import 'package:deepcare/widgets/personalized_scaffold.dart';
import 'package:deepcare/widgets/theme_switcher_button.dart';
import 'package:deepcare/screens/clock/controllers/clock_controller_provider.dart';
import 'package:deepcare/screens/clock/handler/prime_number_handler.dart';
import 'package:deepcare/utils/personalization_controller_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'handler/buttons_animation_handler.dart';

class ClockScreen extends ConsumerWidget {
  const ClockScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final now = DateTime.now();
    final currentTimeAsync = ref.watch(clockControllerProvider);
    final currentTime = currentTimeAsync.valueOrNull ?? now;
    final settings = ref.watch(personalizationControllerProvider);

    final gradient = settings.gradient;
    final spinningColors = settings.spinningAnimationColors;

    return PersonalizedScaffold(
      gradient: gradient,
      spinningAnimationColors: spinningColors,
      body: SafeArea(
        child: PrimeNumberHandler(
          child: ButtonsAnimationHandler(
            builder: (context, opacity) {
              return Stack(
                children: [
                  Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(24),
                    child: ClockDisplay(currentTime: currentTime),
                  ),
                  AnimatedBuilder(
                    animation: opacity,
                    builder: (context, child) {
                      return Opacity(
                        opacity: opacity.value,
                        child: IgnorePointer(
                          ignoring: opacity.value < 0.5,
                          child: child,
                        ),
                      );
                    },
                    child: Stack(
                      children: [
                        Positioned(
                          top: 4,
                          right: 4,
                          child: ThemeSwitcherButton(),
                        ),
                        Positioned(
                          top: 4,
                          left: 4,
                          child: PersonalizationButton(),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
