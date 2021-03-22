import 'package:flutter/material.dart';
import 'dart:math';

class CalculatorBrain {
  CalculatorBrain({this.height, this.weight});

  final int height;
  final int weight;

  double _bmi;

  String calculateBMI() {
    _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getResult() {
    if (_bmi >= 25) {
      return "Overweight";
    } else if (_bmi > 18.5) {
      return "Nomal";
    } else {
      return "underweight";
    }
  }

  String getInterpretation() {
    if (_bmi >= 25) {
      return "お前、太り過ぎだろww痩せろよアホw"
      "そのままでいいのか？笑われているぞw";
    } else if (_bmi > 18.5) {
      return "あんたすごいな。健康に生きているんだな。さすがだよ。";
    } else {
      return "あんた痩せすぎ、ごぼうか？食べろ。";
    }
  }
}
