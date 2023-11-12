import 'package:flutter/material.dart';

import '../constants.dart';

class PlayScreenScore extends StatelessWidget {
  final int score;
  final bool isGameOver;

  const PlayScreenScore({super.key, required this.score, required this.isGameOver});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        '$score',
        style: isGameOver
            ? kPlayScreenGameOverScoreTextStyle
            : kPlayScreenScoreTextStyle,
      ),
    );
  }
}
