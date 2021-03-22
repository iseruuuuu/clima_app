import 'package:flutter/material.dart';
import 'package:BMI_APP/constants.dart';

class ButtomButton extends StatelessWidget {
  ButtomButton({@required this.onTap, @required this.buttonTitle});

  final Function onTap;
  final String buttonTitle;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        child: Center(child: Text(buttonTitle, style: kLargeButtonTextStyle)),
        color: kButtonContinerColor,
        margin: EdgeInsets.only(top: 10),
        padding: EdgeInsets.only(bottom: 10),
        width: double.infinity,
        height: kBottomContainerHeight,
      ),
    );
  }
}
