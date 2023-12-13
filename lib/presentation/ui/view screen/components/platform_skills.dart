import 'package:flutter_svg/svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../data/const/export.dart';

class PlatformSkills extends StatelessWidget {
  const PlatformSkills({
    super.key,
    required this.image,
    required this.title,
    required this.subtitle,
    required this.skill,
  });
  final String image, title, subtitle, skill;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        decoration: BoxDecoration(
            border: Border.all(width: 01, color: Colors.red),
            borderRadius: BorderRadius.circular(20)),
        height: 250,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SvgPicture.asset(
              image,
              height: 50,
              width: 50,
            ),
            FittedBox(
              child: Text(
                title,
                style: TextStyle(fontWeight: FontWeight.bold,),maxLines: 1 
              ),
            ),
            Text(
              subtitle,
              textAlign: TextAlign.center,
            ),
            SizedBox(
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Text(
                  skill,
                  textAlign: TextAlign.start,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}