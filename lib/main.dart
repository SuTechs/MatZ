import 'package:flutter/material.dart';
import 'package:matz/Screens/Home.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'data/Level.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences savedData = await SharedPreferences.getInstance();
  Map<String, int> highestScores = {
    '1': savedData.getInt('highestScoreOf1') ?? 0,
    '2': savedData.getInt('highestScoreOf2') ?? 0,
    '3': savedData.getInt('highestScoreOf3') ?? 0,
  };
  String lastPlayedLevel = savedData.getString('lastPlayedLevel') ?? '1';

  Level level =
      Level(highestScores: highestScores, lastPlayedLevel: lastPlayedLevel);

  runApp(MyApp(
    level: level,
  ));
}

class MyApp extends StatelessWidget {
  final Level level;

  const MyApp({this.level});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<Level>(
      create: (context) => level,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'MatZ',
        home: Home(),
      ),
    );
  }
}
