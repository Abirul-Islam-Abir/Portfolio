import 'package:portfolio/presentation/ui/view%20screen/components/project_card.dart';

import '../../../../data/const/export.dart';

List<Widget> buildProjectCarouselOption({data}) {
  return List.generate(data.length,
          (index) => ProjectCard(data: data, index: index, linkTap: () {}));
}
