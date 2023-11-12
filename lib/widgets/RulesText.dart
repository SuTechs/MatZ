import 'package:flutter/material.dart';
import 'package:matz/constants.dart';

class RulesText extends StatelessWidget {
  final String level;

  const RulesText({super.key, required this.level});

  static const rulesData = {
    '1': {'plus': 1, 'minus': 5},
    '2': {'plus': 3, 'minus': 50},
    '3': {'plus': 10, 'minus': 999},
  };
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          RichText(
            text: TextSpan(
              text: 'Rules\n',
              style:
                  kHighestScoreStyle.copyWith(fontSize: 22, letterSpacing: 1),
              children: [
                TextSpan(
                  text:
                      'you loose if score < 0\n+${rulesData[level]?['plus']} point on correct answer\n-${rulesData[level]?['minus']} points on wrong answer',
                  style: kHighestScoreTitleStyle.copyWith(
                    fontWeight: FontWeight.w500,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
