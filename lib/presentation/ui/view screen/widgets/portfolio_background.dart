
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

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
          fit: BoxFit.fitHeight,
          colorFilter: ColorFilter.mode(
            Get.isDarkMode ? Colors.black : Colors.white,
            BlendMode.difference,
          ),
        ),
      ),
      child: child,
    );
  }
}