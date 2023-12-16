
import 'package:portfolio/presentation/ui/view%20screen/components/project_card.dart';
import 'package:portfolio/presentation/ui/view%20screen/components/project_view.dart';

import '../../../../data/const/export.dart';

class TabProjectGridBuilder extends StatelessWidget {
  const TabProjectGridBuilder({
    super.key,
    required this.data,
  });

  final List data;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 600,
      child: GridView.builder(physics: NeverScrollableScrollPhysics(),
        itemCount: data.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisExtent: 300,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10),
        itemBuilder: (context, index) => ProjectCard(linkTap: (){},
          data: data,
          index: index,
        ),
      ),
    );
  }
}