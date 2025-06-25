import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../repositories/random_number_repository.dart';

part 'random_number_service.g.dart';

@riverpod
Future<int> randomNumberService(Ref ref) async {
  return await ref.read(randomNumberRepositoryProvider).getRandomNumber();
}
