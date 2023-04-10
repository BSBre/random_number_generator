import 'dart:async';

import 'package:get_it/get_it.dart';
import 'package:random_number_generator/bloc/random_number/random_number.state.dart';
import 'package:random_number_generator/data_sources/_data_sources.dart';
import 'package:rxdart/rxdart.dart';

class RandomNumberBloc implements Disposable {
  final _api = GetIt.I<RandomNumberApi>();

  final state =
      BehaviorSubject<RandomNumberStateBase>.seeded(RandomNumberInitial());

  late final StreamSubscription _subscription;

  RandomNumberBloc() {
    _subscription = _api.get().listen(
      (number) {
        final state = RandomNumberState(
          number: number,
        );

        this.state.add(state);
      },
      onError: state.addError,
    );
  }

  @override
  Future onDispose() async {
    await _subscription.cancel();
  }

  void stopTimer() => _api.stopTimer();
}
