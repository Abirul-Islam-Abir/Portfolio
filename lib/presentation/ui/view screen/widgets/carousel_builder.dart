
 import 'package:carousel_slider/carousel_slider.dart';
import '../../../../data/const/export.dart';
class CarouselBuilder extends StatelessWidget {
  const CarouselBuilder({
    super.key,
    this.items,
    this.onPage, required this.initialPage,
  });
  final List<Widget>? items;
  final Function(int, CarouselPageChangedReason)? onPage;
  final int initialPage;

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: items,
      options: CarouselOptions(
        height: 250,
        aspectRatio: 16 / 9,
        viewportFraction: 0.6,
        initialPage: initialPage,
        enableInfiniteScroll: true,
        reverse: false,
        autoPlay: true,
        autoPlayInterval: Duration(seconds: 3),
        autoPlayAnimationDuration: Duration(milliseconds: 800),
        autoPlayCurve: Curves.fastOutSlowIn,
        enlargeCenterPage: true,
        enlargeFactor: 0.3,
        onPageChanged: onPage,
        scrollDirection: Axis.horizontal,
      ),
    );
  }
}