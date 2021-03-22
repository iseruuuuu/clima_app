

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:BMI_APP/constants.dart';
import 'package:BMI_APP/components/reusable_card.dart';
import 'package:BMI_APP/components/container.dart';
import 'package:BMI_APP/components/reusable_card.dart';
import 'package:BMI_APP/components/round_icon_button.dart';
import 'package:BMI_APP/components/buttom_button.dart';
import 'package:BMI_APP/screens/result_page.dart';
import 'package:BMI_APP/calculator_brain.dart';
import '../constants.dart';


enum Gender {
  mail,
  femail,
}

class InputPage extends StatefulWidget {

  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Color maleCardColor = kInactiveCardColour;
  Color femaleCardColor = kInactiveCardColour;

  Gender selecetedGender;
  int height = 180;
  int weight = 60;
  int age = 18;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BMI計算"),
      ),
      body: Column(
        //次に使える説？？
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          //１段目！！！！！！！
          Expanded(
              child: Row(
            children: <Widget>[
               Expanded(
                child: new ReusableCard(
                  onPress: () {
                    setState(() {
                      selecetedGender = Gender.mail;
                    });
                  },
                  //if文の改良版男かどうか？　true=>男and Color = 黒？　　false=>女and whiteBlack.
                  color: selecetedGender == Gender.mail ? kActiveCardColor : kInactiveCardColour,
                  cardChild: IconContent(icon: FontAwesomeIcons.mars, label: "mail",
                  ),
                ),
              ),
              Expanded(
                child: new ReusableCard(
                  onPress: () {
                    setState(() {
                      selecetedGender = Gender.femail;
                    });
                  },
                  color: selecetedGender == Gender.femail ? kActiveCardColor : kInactiveCardColour,
                  cardChild: IconContent(icon: FontAwesomeIcons.venus, label: "femail",
                  ),
                ),
              ),
            ],
          )),

          //２段目！！！！！！！！
          Expanded(
            child: new ReusableCard(
              color: kActiveCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "Height",
                    style: kLabelTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: <Widget>[
                      //文字として登録するためにStringに
                      Text(
                        height.toString(),
                        style: kNumberTextStyle,
                      ),
                      Text("cm", style: kNumberTextStyle),
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                        inactiveTrackColor: Color(0xFF8D8E98),
                        activeTrackColor: Colors.white,
                        thumbColor: Color(0xFFEB1555),
                        overlayColor: Color(0x15EB1555),
                        thumbShape:
                            RoundSliderThumbShape(enabledThumbRadius: 15),
                        overlayShape:
                            RoundSliderOverlayShape(overlayRadius: 30)),
                    child: Slider(
                      //数の変更のため、Doubleに
                      value: height.toDouble(),
                      min: 120, max: 220,
                      onChanged: (double newValue) {
                        setState(() {
                          height = newValue.round();
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),

          //３段目！！！！(下！！！) 体重！！！！
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: new ReusableCard(
                    color: kActiveCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "Weight",
                          style: kLabelTextStyle,
                        ),
                        Text(
                          weight.toString(),
                          style: kNumberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                                icon: FontAwesomeIcons.minus,
                                onPressed: () {
                                  setState(() {
                                    weight--;
                                  });
                                }),
                            SizedBox(
                              width: 20,
                            ),
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onPressed: () {
                                setState(() {
                                  weight++;
                                });
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),

                //年齢！！！！！！！
                Expanded(
                  child: new ReusableCard(
                    color: kActiveCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "AGE",
                          style: kLabelTextStyle,
                        ),
                        Text(
                          age.toString(),
                          style: kNumberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPressed: () {
                                setState(() {
                                  age--;
                                });
                              },
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            RoundIconButton(
                                icon: FontAwesomeIcons.plus,
                                onPressed: () {
                                  setState(() {
                                    age++;
                                  });
                                })
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),

          //一番下！！赤色のやつ！！！
          ButtomButton(
            buttonTitle: "計算",
            onTap: () {
              CalculatorBrain calc = CalculatorBrain(height: height,weight: weight);
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ResultPage(
                    bmiResult: calc.calculateBMI(),
                    resultText: calc.getResult(),
                    interpretation: calc.getInterpretation(),

                  )));
            },
          ),
        ],
      ),
    );
  }
}


/*

FloatingActionButton(
backgroundColor: Color(0xFF4C4F5E),
child: Icon(Icons.add ,color: Colors.white,),
)

 */

/*
//1 = mail 2 = femail
void updateColor(Gender selectedGender) {
  if (selectedGender == Gender.mail) {
    if (maleCardColor == inactiveCardColour) {
      maleCardColor = activeCardColor;
      femaleCardColor = inactiveCardColour;
    } else {
      maleCardColor = inactiveCardColour;
    }
  }



  if (selectedGender == Gender.femail) {
    if (femaleCardColor == inactiveCardColour) {
      femaleCardColor = activeCardColor;
      maleCardColor = inactiveCardColour;
    } else {
      femaleCardColor = inactiveCardColour;
    }
  }
}

*/

/*
Row
(
children: [
Container
(
margin: EdgeInsets.all(15
)
,
decoration: BoxDecoration
(
//カラーはこの中に入れる
color: Color
(0xFF1D1E33)
,
borderRadius: BorderRadius.circular(10
)
)
,
height: 200
,
width: 170
,
)
,
Container
(
margin: EdgeInsets.all(15
)
,
decoration: BoxDecoration
(
//カラーはこの中に入れる
color: Color
(0xFF1D1E33)
,
borderRadius: BorderRadius.circular(10
)
)
,
height: 200
,
width: 170
,
)
,
]
,
)
,


Container(
margin: EdgeInsets.all(15),
decoration: BoxDecoration(
//カラーはこの中に入れる
color: Color(0xFF1D1E33),
borderRadius: BorderRadius.circular(10)),
height: 150,
width: 370,
),
Row(
children: [
Container(
margin: EdgeInsets.all(15),
decoration: BoxDecoration(
//カラーはこの中に入れる
color: Color(0xFF1D1E33),
borderRadius: BorderRadius.circular(10)),
height: 100,
width: 170,
),
Container(
margin: EdgeInsets.all(15),
decoration: BoxDecoration(
//カラーはこの中に入れる
color: Color(0xFF1D1E33),
borderRadius: BorderRadius.circular(10)),
height: 100,
width: 170,
),
],
),

 */
