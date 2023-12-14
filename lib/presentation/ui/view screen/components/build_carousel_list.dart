import 'package:portfolio/presentation/ui/view%20screen/components/platform_skills.dart';

import '../../../../data/const/export.dart';

List<Widget> buildCarouselList({data}) {
  return List.generate(
    data.length,
    (index) => PlatformSkills(
      a: data[index]['a']??'',
      b: data[index]['b']??'',
      c: data[index]['c']??'',
      d: data[index]['d']??'',
      image: data[index]['image']??'',
      title: data[index]['title']??'',
      subtitle: data[index]['subtitle']??'',
    ),
  );
}
