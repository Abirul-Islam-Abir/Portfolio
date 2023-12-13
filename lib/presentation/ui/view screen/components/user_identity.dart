
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../data/const/export.dart';

class UserIdentity extends StatelessWidget {
  const UserIdentity({
    super.key, this.text, required this.a, required this.b, required this.c, required this.img,
  });
  final String? text;
  final String a, b, c,img;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment. spaceBetween,
        children: [
          Column(
            children: [
              Text(text!,
                style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),

              SizedBox(height: 20),
              DefaultTextStyle(
                style: TextStyle(
                    color: Colors.red, fontSize: 15, fontWeight: FontWeight.w400),
                child: AnimatedTextKit(
                  animatedTexts: [
                    TyperAnimatedText(a),
                    TyperAnimatedText(b),
                    TyperAnimatedText(c),
                  ],
                  onTap: () {

                  },
                ),
              ),

            ],
          ), CircleAvatar(
            backgroundImage: NetworkImage(img),
            radius: 40,
          ),
        ],
      ),
    );
  }
}