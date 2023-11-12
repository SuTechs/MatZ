import 'package:flutter/material.dart';

import 'Buttons.dart';
import 'PlayScreenScore.dart';
import 'PlayScreenTopBar.dart';

class PlayScreenBody extends StatelessWidget {
  final String level;
  final bool isGameOver;
  final int score;
  final String questionText;
  final void Function() onRetryTap;
  final void Function(bool) onYesNoTap;

  const PlayScreenBody({
    super.key,
    required this.level,
    required this.isGameOver,
    required this.score,
    required this.questionText,
    required this.onRetryTap,
    required this.onYesNoTap,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        titleSpacing: 0,
        title: PlayScreenTopBar(
          level: level,
        ),
      ),
      body: Column(
        children: [
          PlayScreenScore(
            score: score,
            isGameOver: isGameOver,
          ),
          Expanded(
            flex: 2,
            child: Center(
              child: Text(
                isGameOver ? 'Game Over ' : questionText,
                style: const TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 40,
                  color: Color(0xffffffff),
                  letterSpacing: 0.08,
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.left,
              ),
            ),
          ),
          Expanded(
            child: isGameOver
                ? RetryButton(
                    onTap: onRetryTap,
                  )
                : YesNoButton(
                    onTap: onYesNoTap,
                  ),
          ),
          const Expanded(
            child: Text(''),
          ),
        ],
      ),
    );
  }
}
