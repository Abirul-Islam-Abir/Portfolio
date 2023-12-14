import 'package:animated_text_kit/animated_text_kit.dart';
import '../../../../data/const/export.dart';

class UserIdentity extends StatelessWidget {
  const UserIdentity({
    super.key,
    this.text,
    required this.a,
    required this.b,
    required this.c,
    required this.img,
  });
  final String? text;
  final String a, b, c, img;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: [
              Text(
                text!,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              SizedBox(height: 20),
              DefaultTextStyle(textAlign: TextAlign.start,
                style: TextStyle(
                    color: Colors.red,
                    fontSize: 14,
                    fontWeight: FontWeight.w400),
                child: AnimatedTextKit(
                  animatedTexts: [
                    TyperAnimatedText(a),
                    TyperAnimatedText(b),
                    TyperAnimatedText(c),
                  ],
                  onTap: () {},
                ),
              ),
            ],
          ),
          CircleAvatar(
            backgroundImage: NetworkImage(img),
            radius: 40,
          ),
        ],
      ),
    );
  }
}
