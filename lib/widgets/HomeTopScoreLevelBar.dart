import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../data/Level.dart';

import '../constants.dart';

class HomeTopScoreLevelBar extends StatefulWidget {
  final Function(String) onChangeLevel;

  HomeTopScoreLevelBar({
    @required this.onChangeLevel,
  });
  @override
  _HomeTopScoreLevelBarState createState() => _HomeTopScoreLevelBarState();
}

class _HomeTopScoreLevelBarState extends State<HomeTopScoreLevelBar> {
  String dropdownValue;

  @override
  void initState() {
    super.initState();
    dropdownValue = Provider.of<Level>(context, listen: false).lastPlayedLevel;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        children: [
          Row(
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
                ' ${Provider.of<Level>(context).highestScores[dropdownValue]}',
                style: kHighestScoreStyle,
              ),
              DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  value: dropdownValue,
                  style: kHighestScoreStyle,
                  isDense: true,
                  onChanged: (String newValue) {
                    setState(() {
                      dropdownValue = newValue;
                    });

                    widget.onChangeLevel(newValue);
                  },
                  items: <String>['1', '2', '3']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
