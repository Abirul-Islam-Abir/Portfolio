
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

class AnimatedTextShow extends StatelessWidget {
  final String a, b, c;

  const AnimatedTextShow(
      {super.key, required this.a, required this.b, required this.c});

  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle(
      style: TextStyle(
          color: Colors.red, fontSize: 15, fontWeight: FontWeight.w400),
      child: AnimatedTextKit(
        animatedTexts: [
          TyperAnimatedText(a),
          TyperAnimatedText(b),
          TyperAnimatedText(c),
        ],
        onTap: () {
          print("Tap Event");
        },
      ),
    );
  }
}