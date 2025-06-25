import 'package:deepcare/core/constants/app_constants.dart';
import 'package:deepcare/core/extensions/int.dart';
import 'package:deepcare/screens/prime-number/prime_number_modal_sheet.dart';
import 'package:deepcare/utils/shared_preferences_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../controllers/random_number_stream_controller.dart';

class PrimeNumberHandler extends ConsumerWidget {
  const PrimeNumberHandler({
    super.key,
    required this.child,
    this.interval = 10,
  });

  final Widget child;
  final int interval;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = randomNumberStreamControllerProvider(interval: interval);

    Future<void> showPrimeNumberModal(BuildContext context, int number) {
      return showModalBottomSheet(
        context: context,
        useSafeArea: true,
        showDragHandle: true,
        useRootNavigator: true,
        isScrollControlled: true,
        builder: (context) => PrimeNumberModalSheet(number: number),
      );
    }

    void saveLastPrimeNumberDate(WidgetRef ref) {
      final prefs = ref.read(sharedPreferencesProvider);
      prefs.setInt(
        AppConstants.lastPrimeNumberDate,
        DateTime.now().millisecondsSinceEpoch,
      );
    }

    final isCurrent = ModalRoute.isCurrentOf(context) ?? false;

    if (isCurrent) {
      ref.listen<AsyncValue<int>>(provider, (previous, next) {
        final number = next.valueOrNull;
        if (number == null) return;

        if (number.isPrime) {
          HapticFeedback.mediumImpact();
          ref.read(provider.notifier).stop();

          showPrimeNumberModal(context, number).then((_) {
            saveLastPrimeNumberDate(ref);
            ref.read(provider.notifier).restart();
          });
        }
      });
    }

    return child;
  }
}
