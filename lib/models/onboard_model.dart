
import 'package:flutter/material.dart';

class Onboardmodel {
  final String? lottie;
  final String ? text;
  final MaterialColor ? color;
  final bool ? backbutton;
  final bool ? skipbutton;

  Onboardmodel({this.skipbutton=true, this.lottie, this.text, this.color, this.backbutton = true,});
}