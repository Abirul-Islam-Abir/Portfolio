import 'package:flutter/material.dart';

class HeadlineText extends StatelessWidget {
  final String? text;

  const HeadlineText(this.text);
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Text(text!,
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 25),
            textAlign: TextAlign.center),
      ),
    );
  }
}