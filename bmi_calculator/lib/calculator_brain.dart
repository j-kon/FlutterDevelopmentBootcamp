import 'dart:math';

class CalculatorBrain {
  CalculatorBrain({this.height, this.weight});

  final int height;
  final int weight;

  double _bmi;

  String calculateBMI() {
    _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getResult() {
    if (_bmi >= 20) {
      return 'Overweight';
    } else if (_bmi > 19.0) {
      return 'Normal';
    } else {
      return 'Underweight';
    }
  }

  String getInterpretation() {
    if (_bmi >= 20) {
      return 'You are higher than normal body weight. Try to exercise more.';
    } else if (_bmi > 19.0) {
      return 'You have a normal body weight. Good job!';
    } else {
      return 'You have a lower than body weight. You can eat a bit more.';
    }
  }
}
