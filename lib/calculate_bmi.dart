import 'dart:math';

class CalculateBMI {
  CalculateBMI({this.height, this.weight});
  final int height;
  final int weight;
  double _bmi;
  String getBmi() {
    _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getResult() {
    if (_bmi >= 25)
      return 'OverWeight';
    else if (_bmi > 18.5) return 'Normal';
    return 'UnderWeight';
  }

  String getInterpretation() {
    if (_bmi >= 25)
      return ' Your weight is higher than normal.You should do some exercise';
    else if (_bmi > 18.5) return 'You have normal weight.Good Job!';
    return 'Your weight is lesser than normal weight.You should eat some healthy food';
  }
}
