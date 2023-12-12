
import '../../../../data/const/export.dart';

class SocialLogoCard extends StatelessWidget {
  const SocialLogoCard({
    super.key,
    required this.image,
  });
  final String image;
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Image.network(
          image,
          height: 20,
          width: 20,
        ),
      ),
    );
  }
}