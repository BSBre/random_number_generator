import 'dart:async';
import 'dart:math';

import 'package:get_it/get_it.dart';
import 'package:random_number_generator/model/_model.dart';
import 'package:random_number_generator/repositories/api_platform.dart';
import 'package:rxdart/rxdart.dart';

class RandomNumberApi {
  Timer? timer;
  final _randomNumber = ReplaySubject<RandomNumber>(maxSize: 1);
  final _apiPlatform = GetIt.I<ApiPlatform>();

  RandomNumberApi() {
    startTimer();
  }

  Stream<RandomNumber> get() => _randomNumber.asBroadcastStream();

  void startTimer() {
    fetch();
    timer = Timer.periodic(const Duration(seconds: 30), (timer) async {
      fetch();
    });
  }

  void stopTimer() {
    timer?.cancel();
  }

  Future<void> fetch() async {
    try {
      final RandomNumber number =
          await _apiPlatform.getNumber('1', '1', '1', '100', '10');
      _randomNumber.add(number);
    } catch (e) {
      final int number = Random().nextInt(100);
      _randomNumber.add(
        RandomNumber(
          number: number,
        ),
      );
    }
  }
}
