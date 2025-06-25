import 'dart:async';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../services/random_number_service.dart';

part 'random_number_stream_controller.g.dart';

@riverpod
class RandomNumberStreamController extends _$RandomNumberStreamController {
  late StreamController<int> controller;
  Timer? _timer;
  int _interval = 10;

  @override
  Stream<int> build({int interval = 10}) {
    _interval = interval;
    ref.onDispose(() {
      stop();
    });

    controller = StreamController<int>.broadcast();
    start();
    return controller.stream;
  }

  Stream<int> get stream => controller.stream;

  void start() {
    _timer = Timer.periodic(Duration(seconds: _interval), (timer) async {
      try {
        final number = await ref.read(randomNumberServiceProvider.future);
        controller.add(number);
      } catch (e) {
        controller.addError(e);
      }
    });
  }

  void stop() {
    _timer?.cancel();
    _timer = null;
  }

  void restart() {
    stop();
    start();
  }
}
