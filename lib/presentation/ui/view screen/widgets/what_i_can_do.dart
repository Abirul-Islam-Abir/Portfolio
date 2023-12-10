import 'package:flutter/material.dart';

class WhatICanDoText extends StatelessWidget {
  final String? text;

  const WhatICanDoText(this.text);
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Text(text!,
          style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
          textAlign: TextAlign.center),
    );
  }
}