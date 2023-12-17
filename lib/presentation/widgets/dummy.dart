import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class DummyText extends StatelessWidget {
  const DummyText(this.text, {this.align = TextAlign.center});
  final String? text;
  final TextAlign? align;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: AutoSizeText(
        text!,
        textAlign: align,
      ),
    );
  }
}