  import 'package:flutter/material.dart';
import 'package:portfolio/presentation/ui/view%20screen/home_screen.dart';
  import 'package:responsive_sizer/responsive_sizer.dart';

void main() {
  runApp(Portfolio());
}



class Portfolio extends StatelessWidget {
  const Portfolio({super.key});

  @override
  Widget build(BuildContext context) {

      return ResponsiveSizer(
          builder: (context, orientation, screenType) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            theme: ThemeData(
              fontFamily: 'Poppins',
               brightness: Brightness.light,
              // brightness: Brightness.dark,
              scaffoldBackgroundColor: Colors.transparent,
              appBarTheme: AppBarTheme(
                backgroundColor: Colors.transparent,
              ),
            ),
            home: HomeScreen(),
          );
        }
      );

  }
}










