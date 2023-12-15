
import 'package:portfolio/presentation/ui/view%20screen/components/platform_skills.dart';

import '../../../../data/const/export.dart';

class TabGridViewBuilder extends StatelessWidget {
  const TabGridViewBuilder({
    super.key,
    required this.data,
  });
  final List data;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 600,
      child: GridView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: data.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisExtent: 250,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20),
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