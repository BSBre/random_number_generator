import 'dart:convert';

class RandomNumber {
  RandomNumber({
    required this.number,
  });

  factory RandomNumber.fromJson(int number) {
    return RandomNumber(
      number: number,
    );
  }

  String toJson() => json.encode({
        'number': number,
      });

  int? number;
}
