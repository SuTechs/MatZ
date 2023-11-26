import 'dart:math';

import 'package:math_expressions/math_expressions.dart';

_Q _getQ(String level) {
  ContextModel cm = ContextModel();
  bool answer;
  late String qText;

  switch (level) {
    case '1':
      String operator = _getRandomOperator(['+', '-']);

      qText =
          '${_getRandomNumber(-15, 20)} $operator ${_getRandomNumber(0, 20)}';
      break;
    case '2':
      String operator = _getRandomOperator(['+', '-', '*']);

      qText =
          '${_getRandomNumber(-25, 30)} $operator ${_getRandomNumber(0, 30)}';

      break;
    case '3':
      String operator1 = _getRandomOperator(['+', '-', '*']);
      String operator2 = _getRandomOperator(['+', '-']);
      List<String> operator = [operator1, operator2];
      operator.shuffle();

      qText =
          '${_getRandomNumber(-25, 30)} ${operator[0]} ${_getRandomNumber(0, 20)} ${operator[1]} ${_getRandomNumber(0, 20)}';

      break;
  }

  Expression expression = Parser().parse(qText);
  double actualSum = expression.evaluate(EvaluationType.REAL, cm);

  int sum = actualSum.toInt();

  int randomAnswer = _getRandomNumber(sum - 1, sum + 2);

  if (randomAnswer == sum) {
    answer = true;
  } else {
    answer = false;
  }

  qText += ' = $randomAnswer';

  return _Q(qText: qText, qAns: answer);
}

int _getRandomNumber(int min, int max) => Random().nextInt(max - min) + min;

String _getRandomOperator(List<String> operators) =>
    operators[Random().nextInt(operators.length)];

class _Q {
  final String qText;
  final bool qAns;

  _Q({required this.qText, required this.qAns});
}

class Brain {
  late String _level;
  late _Q _question;
  late int _plusPoint;
  late int _minusPoint;

  initializeBrain(String level) {
    final Map<String, Map<String, int>> scoreRule = {
      '1': {'plus': 1, 'minus': -5},
      '2': {'plus': 3, 'minus': -50},
      '3': {'plus': 10, 'minus': -999},
    };

    _plusPoint = scoreRule[level]!['plus']!;
    _minusPoint = scoreRule[level]!['minus']!;
    _level = level;

    _question = _getQ(_level);
  }

  int scoreReward(bool answer) {
    if (answer == _question.qAns) return _plusPoint;
    return _minusPoint;
  }

  String getQuestionText() => _question.qText.replaceAll('*', 'x');

  void nextQuestion() {
    _question = _getQ(_level);
  }
}
