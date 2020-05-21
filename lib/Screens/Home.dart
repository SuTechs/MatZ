import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:matz/constants.dart';
import 'package:matz/data/Level.dart';
import 'package:matz/widgets/Buttons.dart';
import 'package:matz/widgets/HomeScreenImage.dart';
import 'package:matz/widgets/RulesText.dart';
import 'package:matz/widgets/HomeTopScoreLevelBar.dart';
import 'package:provider/provider.dart';
import 'Play.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String currentLevel;

  @override
  void initState() {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    super.initState();
    currentLevel = Provider.of<Level>(context, listen: false).lastPlayedLevel;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kScaffoldBackgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            HomeTopScoreLevelBar(
              onChangeLevel: (String level) {
                setState(() {
                  currentLevel = level;
                });
              },
            ),
            Expanded(
              child: Center(
                child: HomeScreenImage(
                  level: currentLevel,
                ),
              ),
            ),
            Expanded(
              child: Center(
                child: PlayNowButton(
                  onTap: () {
                    Provider.of<Level>(context, listen: false)
                        .setLastPlayedLevel(currentLevel);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Play(
                          level: currentLevel,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            Expanded(
              child: Center(
                child: RulesText(
                  level: currentLevel,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
