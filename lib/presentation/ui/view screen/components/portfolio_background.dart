
import 'package:flutter/material.dart';

class PortfolioBackground extends StatelessWidget {
  const PortfolioBackground({
    super.key,
    required this.child,
  });
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/background.jpg'),
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(
          Colors.white,
            BlendMode.difference,
          ),
        ),
      ),
      child: child,
    );
  }
}