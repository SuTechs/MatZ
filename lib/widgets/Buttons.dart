import 'package:flutter/material.dart';
import 'package:matz/constants.dart';

class _CustomButton extends StatelessWidget {
  final Function onTap;
  final double width;
  final double height;
  final Color color;
  final String buttonText;
  final TextStyle buttonTextStyle;

  _CustomButton(
      {@required this.onTap,
      this.width,
      this.height,
      this.color,
      @required this.buttonText,
      this.buttonTextStyle});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30.0),
            color: color,
            boxShadow: [
              BoxShadow(
                color: Colors.white,
                blurRadius: 2.0,
                spreadRadius: 2.0,
              ),
            ]),
        child: Center(
          child: Text(
            buttonText,
            style: buttonTextStyle,
          ),
        ),
      ),
    );
  }
}

class PlayNowButton extends StatelessWidget {
  final Function onTap;

  const PlayNowButton({Key key, @required this.onTap}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return _CustomButton(
      width: 194.0,
      height: 50.0,
      buttonText: 'Play Now',
      buttonTextStyle: kPlayNowButtonTextStyle,
      color: kGreenColor,
      onTap: onTap,
    );
  }
}

class RetryButton extends StatelessWidget {
  final Function onTap;

  const RetryButton({Key key, @required this.onTap}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Center(
      child: _CustomButton(
        width: 125.0,
        height: 49.0,
        buttonText: 'Retry',
        buttonTextStyle: kPlayNowButtonTextStyle,
        color: kGreenColor,
        onTap: onTap,
      ),
    );
  }
}

class YesNoButton extends StatelessWidget {
  final void Function(bool) onTap;

  const YesNoButton({@required this.onTap});

  @override
  Widget build(BuildContext context) {
    List<Color> color = [kGreenColor, Colors.red];
    color.shuffle();

    List<_CustomButton> buttons = [
      _CustomButton(
        width: 125,
        height: 50,
        buttonText: 'Yes',
        buttonTextStyle: kYesNoButtonTextStyle,
        onTap: () {
          onTap(true);
        },
        color: color[0],
      ),
      _CustomButton(
        width: 125,
        height: 50,
        buttonText: 'No',
        buttonTextStyle: kYesNoButtonTextStyle,
        onTap: () {
          onTap(false);
        },
        color: color[1],
      ),
    ];
    buttons.shuffle();

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        buttons[0],
        SizedBox(
          width: 25,
        ),
        buttons[1],
      ],
    );
  }
}
