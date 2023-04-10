import 'package:flutter/material.dart';
import 'package:random_number_generator/model/_model.dart';

@immutable
abstract class RandomNumberStateBase {}

class RandomNumberInitial extends RandomNumberStateBase {}

class RandomNumberState extends RandomNumberStateBase {
  final RandomNumber number;

  RandomNumberState({
    required this.number,
  });
}
