import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../constants.dart';
import '../data/Level.dart';

class PlayScreenTopBar extends StatelessWidget {
  final String level;

  const PlayScreenTopBar({super.key, required this.level});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'HIGHEST SCORE',
                style: kHighestScoreTitleStyle,
              ),
              Text(
                'LEVEL',
                style: kHighestScoreTitleStyle,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                ' ${Provider.of<Level>(context).highestScores[level]}',
                style: kHighestScoreStyle,
              ),
              Text(
                ' $level',
                style: kHighestScoreStyle,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
