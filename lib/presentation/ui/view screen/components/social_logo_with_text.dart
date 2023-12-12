
import 'package:portfolio/presentation/ui/view%20screen/components/social_logo_card.dart';

import '../../../../data/const/dummy_social_logo.dart';
import '../../../../data/const/export.dart';

class SocialLogoWithTextCard extends StatelessWidget {
  const SocialLogoWithTextCard({
    super.key,
    required this.headline,
    required this.subtitle,
    required this.startedTap,
    required this.logo,
    this.fbTap,
    this.twitTap,
    this.linkTap,
    this.insTap,
    this.snapTap,
  });
  final String headline, subtitle;
  final Function()? startedTap, fbTap, twitTap, linkTap, insTap, snapTap;
  final List logo;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        height: 180,
        width: double.infinity,
        padding:   const EdgeInsets.symmetric(horizontal:  8 ),
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  headline,
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                const Spacer(),
                SizedBox(
                  height: 25,
                  child: OutlinedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                    onPressed: startedTap,
                    child: const Text(
                      'Get Started',
                      style: TextStyle(color: Colors.blue),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Text(
                  subtitle,
                  style: const TextStyle(fontSize: 10),
                ),
                const Spacer(),
                const Text('')
              ],
            ),
            const Spacer(),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(
                  logo.length,
                      (index) => SocialLogoCard(
                      image: '${logo[index]['imageUrl']}'),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}