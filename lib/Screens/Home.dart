import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lottie/lottie.dart';
import 'package:matz/constants.dart';
import 'package:matz/data/Level.dart';
import 'package:matz/widgets/Buttons.dart';
import 'package:matz/widgets/HomeScreenImage.dart';
import 'package:matz/widgets/HomeTopScoreLevelBar.dart';
import 'package:matz/widgets/RulesText.dart';
import 'package:provider/provider.dart';

import 'Play.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late String currentLevel;

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
      appBar: AppBar(
        titleSpacing: 0,
        backgroundColor: kScaffoldBackgroundColor,
        title: HomeTopScoreLevelBar(
          onChangeLevel: (String level) {
            setState(() {
              currentLevel = level;
            });
          },
        ),
      ),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 16*2),
            child: Lottie.asset('assets/lotties/elements.json', repeat: true,reverse: true),
          ),
          Column(
            children: [
              const SizedBox(height: 64,),
              HomeScreenImage(
                level: currentLevel,
              ),
              const SizedBox(height: 72,),
              PlayNowButton(
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
              const Spacer(),
              RulesText(
                level: currentLevel,
              ),
              const SizedBox(height: 16),

            ],
          ),
        ],
      ),
    );
  }
}
