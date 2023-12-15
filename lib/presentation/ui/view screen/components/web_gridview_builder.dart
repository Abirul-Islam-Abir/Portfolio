
import 'package:portfolio/presentation/ui/view%20screen/components/platform_skills.dart';

import '../../../../data/const/export.dart';

class WebGridViewBuilder extends StatelessWidget {
  const WebGridViewBuilder({
    super.key,
    required this.data,
  });
  final List data;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 350,
      child: GridView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: data.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4, mainAxisExtent: 300, crossAxisSpacing: 10),
        itemBuilder: (context, index) => PlatformSkills(
          a: data[index]['a'] ?? '',
          b: data[index]['b'] ?? '',
          c: data[index]['c'] ?? '',
          d: data[index]['d'] ?? '',
          image: data[index]['image'] ?? '',
          title: data[index]['title'] ?? '',
          subtitle: data[index]['subtitle'] ?? '',
        ),
      ),
    );
  }
}