import 'dart:async';

import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart';
import 'package:random_number_generator/bloc/_bloc.dart';

import 'package:random_number_generator/main.dart';
import 'package:random_number_generator/model/_model.dart';
import 'package:random_number_generator/repositories/api_platform.dart';
import 'package:http/testing.dart';

void main() {
  RandomNumberBloc? randomNumberBloc;
  testWidgets('Test random number', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    randomNumberBloc = GetIt.I<RandomNumberBloc>();

    final mock = MockClient((request) {
      return Future.value(
        Response(
          '10',
          200,
        ),
      );
    });
    final client = ApiPlatform.forTesting(mock);

    try {
      final RandomNumber number =
          await client.getNumber('1', '1', '1', '100', '10');
      expect(number.number, 10);
    } catch (e) {
      expect(e, const TypeMatcher<TimeoutException>());
    }

    expect(randomNumberBloc?.state.value, isA<RandomNumberState>());
    randomNumberBloc?.stopTimer();
  });
}
