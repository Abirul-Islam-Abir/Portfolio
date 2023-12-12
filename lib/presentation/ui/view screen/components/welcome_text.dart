
import 'package:flutter/material.dart';

class WelcomeText extends StatelessWidget {
  const WelcomeText({
    super.key,
    required this.text,
    required this.image,
  });

  final String text, image;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(text),
        Image.asset(
          image,
          height: 20,
          width: 20,
        )
      ],
    );
  }
}