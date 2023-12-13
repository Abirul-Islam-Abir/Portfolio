import 'package:flutter/material.dart';

class DummyText extends StatelessWidget {
  const DummyText(this.text, {this.align = TextAlign.center});
  final String? text;
  final TextAlign? align;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Text(
        text!,
        textAlign: align,
      ),
    );
  }
}