import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio/presentation/state%20holder%20binder/state_holder_binder.dart';
import 'package:portfolio/presentation/ui/view%20screen/home_screen.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:device_preview/device_preview.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    Portfolio(),

    /*DevicePreview(
    enabled: !kReleaseMode,
    builder: (context) => Portfolio(), // Wrap your app
  ),*/
  );
}

class Portfolio extends StatelessWidget {
  const Portfolio({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(
      builder: (context, orientation, screenType) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          useInheritedMediaQuery: true,
          locale: DevicePreview.locale(context),
          builder: DevicePreview.appBuilder,
          title: 'Abirul Islam Abir',
          initialBinding: StateHolderBinding(),
          theme: ThemeData(
            fontFamily: 'Poppins',
            // brightness: Brightness.light,
            brightness: Brightness.dark,
            scaffoldBackgroundColor: Colors.transparent,
            elevatedButtonTheme: ElevatedButtonThemeData(style: ElevatedButton.styleFrom(backgroundColor: Colors.red)),
            appBarTheme: AppBarTheme(
              backgroundColor: Colors.transparent,
            ),
          ),
          home: HomeScreen(),
        );
      },
      maxTabletWidth: 900,
    );
  }
}
