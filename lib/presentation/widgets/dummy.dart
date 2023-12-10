import 'package:flutter/material.dart';

class DummyText extends StatelessWidget {
  const DummyText(this.text);
  final String? text;
  @override
  Widget build(BuildContext context) {
    return Text(
      text!,
      textAlign: TextAlign.center,
    );
  }
}