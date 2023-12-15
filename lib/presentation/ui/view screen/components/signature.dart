
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../data/const/export.dart';

class Signature extends StatelessWidget {
  const Signature({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      '< Abir />',
      style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.bold),
    );
  }
}