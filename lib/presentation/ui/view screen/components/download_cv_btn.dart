
import 'package:flutter/material.dart';

class DownloadCvButton extends StatelessWidget {
  const DownloadCvButton({
    super.key,
    required this.onTap,
    required this.text,
  });
  final Function() onTap;
  final String text;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 150,
      child: OutlinedButton(
        onPressed: onTap,
        child: Text(
          text,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}