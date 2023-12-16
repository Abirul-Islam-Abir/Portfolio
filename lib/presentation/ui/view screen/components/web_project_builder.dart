import 'package:portfolio/presentation/ui/view%20screen/components/project_card.dart';
import 'package:portfolio/presentation/ui/view%20screen/components/project_view.dart';

import '../../../../data/const/export.dart';

class WebProjectGridBuilder extends StatelessWidget {
  const WebProjectGridBuilder({
    super.key,
    required this.data,
  });

  final List data;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      child: GridView.builder(physics: NeverScrollableScrollPhysics(),
        itemCount: data.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          mainAxisExtent: 300,
          crossAxisSpacing: 20,
        ),
        itemBuilder: (context, index) => ProjectCard(linkTap: (){},
          data: data,
          index: index,
        ),
      ),
    );
  }
}