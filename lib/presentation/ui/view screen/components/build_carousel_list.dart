import 'package:portfolio/presentation/ui/view%20screen/components/platform_skills.dart';

import '../../../../data/const/export.dart';

List<Widget> buildCarouselList({dummyPlatformData}) {
  return List.generate(
    dummyPlatformData.length,
        (index) => PlatformSkills(
      skill: dummyPlatformData[index]['skill'],
      image: dummyPlatformData[index]['image'],
      title: dummyPlatformData[index]['title'],
      subtitle: dummyPlatformData[index]['subtitle'],
    ),
  );
}