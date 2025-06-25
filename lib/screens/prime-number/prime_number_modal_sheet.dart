import 'package:deepcare/core/extensions/context.dart';
import 'package:deepcare/core/extensions/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:timeago/timeago.dart' as timeago;

import 'contollers/last_prime_number_date_provider.dart';
import 'widgets/confetti_animations.dart';
import 'widgets/number_widget.dart';

class PrimeNumberModalSheet extends ConsumerWidget {
  const PrimeNumberModalSheet({super.key, required this.number});

  final int number;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final locale = Localizations.localeOf(context);
    final languageCode = locale.languageCode;

    final timeSinceLastPrime = ref.watch(lastPrimeNumberDateProvider);

    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: SafeArea(
            top: false,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  context.l10n.primeNumberSheetTitle,
                  style: context.textTheme.headlineMedium?.bold,
                ),
                const SizedBox(height: 24),
                Text(
                  context.l10n.primeNumberSheetSubtitle,
                  style: context.textTheme.titleMedium?.semibold,
                ),
                Text(
                  timeSinceLastPrime != null
                      ? context.l10n.primeNumberSheetTimeSinceLastPrime(
                          timeago.format(
                            timeSinceLastPrime,
                            locale: languageCode,
                          ),
                        )
                      : context.l10n.primeNumberSheetFirstTime,
                  style: context.textTheme.labelMedium,
                ),
                const SizedBox(height: 48),
                Center(child: NumberWidget(number: number)),
                const Spacer(),
                Text(
                  context.l10n.primeNumberDescription,
                  style: context.textTheme.labelSmall,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 4),
                FilledButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text(context.l10n.primeNumberSheetCta),
                ),
                const SizedBox(height: 8),
              ],
            ),
          ),
        ),
        ConfettiAnimations(),
      ],
    );
  }
}
