import 'package:carousel_slider/carousel_slider.dart';
import 'package:device_preview/device_preview.dart';
import 'package:portfolio/presentation/ui/view%20screen/components/project_view.dart';

import '../../../../data/const/export.dart';

class ProjectCarouselBuilder extends StatelessWidget {
  const ProjectCarouselBuilder({
    super.key, required this.initialPage, this.onPage, required this.items,
  });

  final List<Widget>  items;
final int initialPage;
final Function(int, CarouselPageChangedReason)? onPage;
  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items:  items,
      options: CarouselOptions(
        height: 300,
        aspectRatio: 16 / 9,
        viewportFraction: 0.9,
        initialPage: initialPage,
        enableInfiniteScroll: true,
        reverse: false,
        autoPlay: false,
        autoPlayInterval: Duration(seconds: 3),
        autoPlayAnimationDuration: Duration(milliseconds: 800),
        autoPlayCurve: Curves. easeIn,
        enlargeCenterPage: true,
        enlargeFactor: 0.3,
        onPageChanged: onPage,
        scrollDirection: Axis.horizontal,
      ),
    );
  }
}
