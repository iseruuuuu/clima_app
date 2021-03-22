import 'package:flutter/material.dart';
import 'package:BMI_APP/constants.dart';
import 'package:BMI_APP/components//reusable_card.dart';
import 'package:BMI_APP/components/buttom_button.dart';

class ResultPage extends StatelessWidget {
  ResultPage({@required this.interpretation, @required this.bmiResult, @required this.resultText});

  final String bmiResult;
  final String resultText;
  final String interpretation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(""),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              child: Container(
                padding: EdgeInsets.all(15),
                alignment: Alignment.bottomLeft,
                child: Text(
                  "あなたのBMI",
                  style: kTitleTextStyle,
                ),
              ),
            ),
            Expanded(
              flex: 5,
              child: ReusableCard(
                color: kActiveCardColor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    //１つ目！！！
                    Text(resultText.toUpperCase(), style: kResultTextStyle,),
                    //２つ目！！！
                    Text(bmiResult, style: kBMITextStyle,),
                    //3つ目！！！
                    Text(interpretation, style: kBodyTextStyle, textAlign: TextAlign.center,
                    )
                  ],
                ),
              ),
            ),
            ButtomButton(buttonTitle: "再計算する。",
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ));
  }
}
