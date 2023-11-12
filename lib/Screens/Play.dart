import 'package:flutter/material.dart';
import 'package:matz/constants.dart';
import 'package:matz/data/Level.dart';
import 'package:matz/data/question.dart';
import 'package:matz/widgets/PlayScreenBody.dart';
import 'package:provider/provider.dart';

class Play extends StatefulWidget {
  final String level;

  const Play({super.key, required this.level});

  @override
  State<Play> createState() => _PlayState();
}

class _PlayState extends State<Play> with SingleTickerProviderStateMixin {
  final GlobalKey<_PlayBackgroundAnimationState> _key = GlobalKey();

  Brain brain = Brain();
  int score = 0;
  bool isGameOver = false;

  @override
  void initState() {
    super.initState();
    brain.initializeBrain(widget.level);
  }

  void onRetryTapped() {
    setState(() {
      score = 0;
      isGameOver = false;
      _key.currentState?.restartAnimation();
      brain.nextQuestion();
    });
  }

  void onYesNoButtonTapped(bool value) {
    setState(() {
      score += brain.scoreReward(value);
      brain.nextQuestion();

      final highestScore = Provider.of<Level>(context, listen: false)
              .highestScores[widget.level] ??
          0;

      if (score > highestScore) {
        Provider.of<Level>(context, listen: false)
            .setHighestScoreOf(widget.level, score);
      } else if (score < 0) {
        isGameOver = true;
      }

      if (!isGameOver) {
        _key.currentState?.restartAnimation();
      } else {
        _key.currentState?.controller.stop();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kScaffoldBackgroundColor,
      body: Stack(
        children: [
          PlayBackgroundAnimation(
            key: _key,
            onAnimationEnd: () {
              setState(() {
                isGameOver = true;
              });
            },
          ),
          PlayScreenBody(
            level: widget.level,
            isGameOver: isGameOver,
            score: score,
            questionText: brain.getQuestionText(),
            onRetryTap: onRetryTapped,
            onYesNoTap: onYesNoButtonTapped,
          ),
        ],
      ),
    );
  }
}

class PlayBackgroundAnimation extends StatefulWidget {
  final void Function() onAnimationEnd;

  const PlayBackgroundAnimation({super.key, required this.onAnimationEnd});

  @override
  _PlayBackgroundAnimationState createState() =>
      _PlayBackgroundAnimationState();
}

class _PlayBackgroundAnimationState extends State<PlayBackgroundAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;

  @override
  void initState() {
    super.initState();

    controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 5));
    controller.forward();

    controller.addListener(() {
      if (controller.status == AnimationStatus.completed) {
        widget.onAnimationEnd();
      }
      setState(() {});
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void restartAnimation() {
    controller.reset();
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width * controller.value,
      color: const Color(0xffAEDEF7).withOpacity(0.3),
    );
  }
}
