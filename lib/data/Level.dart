import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Level extends ChangeNotifier {
  Map<String, int> highestScores;
  String lastPlayedLevel;

  Level({this.highestScores, this.lastPlayedLevel});

  void setHighestScoreOf(String level, int newHighScore) async {
    highestScores[level] = newHighScore;
    SharedPreferences savedData = await SharedPreferences.getInstance();
    savedData.setInt('highestScoreOf$level', highestScores[level]);
    notifyListeners();
  }

  void setLastPlayedLevel(String newLastPlayedLevel) async {
    lastPlayedLevel = newLastPlayedLevel;
    SharedPreferences savedData = await SharedPreferences.getInstance();
    savedData.setString('lastPlayedLevel', lastPlayedLevel);
    notifyListeners();
  }
}
