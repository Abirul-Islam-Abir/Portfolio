
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
        padding: const EdgeInsets.symmetric(horizontal: 15.0,vertical: 15),
        child: Image.network(
          image,
          height: 20,
          width: 20,
        ),
      ),
    );
  }
}