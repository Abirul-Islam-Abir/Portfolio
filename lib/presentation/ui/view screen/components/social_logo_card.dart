
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../data/const/export.dart';

class SocialLogoCard extends StatelessWidget {
  const SocialLogoCard({
    super.key,
    required this.image,
  });
  final String image;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding:   EdgeInsets.all(8.w/5),
      child: Image.network(
        image,
        height: 30,
        width: 30,
      ),
    );
  }
}