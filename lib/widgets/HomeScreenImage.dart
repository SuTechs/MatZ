import 'dart:math';

import 'package:flutter/material.dart';

class HomeScreenImage extends StatelessWidget {
  final String level;
  HomeScreenImage({@required this.level});

  static const message = [
    'Hardest Game Ever Created',
    'Hardest Game Ever Created',
    'Simple But Hard',
    'Try Level 3',
    'Hardest Game Ever Created',
  ];

  @override
  Widget build(BuildContext context) {
    precacheImage(AssetImage('assets/images/1.png'), context);
    precacheImage(AssetImage('assets/images/2.png'), context);
    precacheImage(AssetImage('assets/images/3.png'), context);

    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Container(
          width: 234.0,
          height: 232.0,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/$level.png'),
              fit: BoxFit.cover,
              colorFilter: new ColorFilter.mode(
                  Colors.black.withOpacity(0.5), BlendMode.dstIn),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 5),
          child: Text(
            'MatZ',
            style: TextStyle(
              fontFamily: 'Poppins',
              fontSize: 44,
              color: Colors.yellow,
              letterSpacing: 0.088,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        Text(
          message[Random().nextInt(message.length)],
          style: TextStyle(
            fontFamily: 'Poppins',
            fontSize: 18,
            color: const Color(0xffffffff),
            letterSpacing: 0.036000000000000004,
            fontWeight: FontWeight.w300,
          ),
        ),
      ],
    );
  }
}
