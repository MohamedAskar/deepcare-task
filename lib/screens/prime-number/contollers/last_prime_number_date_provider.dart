import 'package:deepcare/core/constants/app_constants.dart';
import 'package:deepcare/utils/shared_preferences_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

part 'last_prime_number_date_provider.g.dart';

@riverpod
DateTime? lastPrimeNumberDate(Ref ref) {
  final prefs = ref.read(sharedPreferencesProvider);
  final lastPrimeNumberDate = prefs.getInt(AppConstants.lastPrimeNumberDate);

  if (lastPrimeNumberDate == null) {
    return null;
  }

  return DateTime.fromMillisecondsSinceEpoch(lastPrimeNumberDate);
}
