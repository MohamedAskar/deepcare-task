import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'clock_controller_provider.g.dart';

@riverpod
Stream<DateTime> clockController(Ref ref) {
  late StreamController<DateTime> controller;
  Timer? timer;

  controller = StreamController<DateTime>(
    onListen: () {
      final now = DateTime.now();
      controller.add(now);

      final secondsUntilNextMinute = 60 - now.second;

      timer = Timer(Duration(seconds: secondsUntilNextMinute), () {
        controller.add(DateTime.now());

        timer = Timer.periodic(const Duration(minutes: 1), (Timer t) {
          controller.add(DateTime.now());
        });
      });
    },
    onCancel: () {
      timer?.cancel();
    },
  );

  ref.onDispose(() {
    timer?.cancel();
    controller.close();
  });

  return controller.stream;
}
