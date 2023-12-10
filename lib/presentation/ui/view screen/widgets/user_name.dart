
import 'package:flutter/material.dart';

class UserName extends StatelessWidget {
  UserName(this.text);
  final String? text;
  @override
  Widget build(BuildContext context) {
    return Text(text!,
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20));
  }
}