
import 'package:flutter/foundation.dart';
import 'package:portfolio/presentation/ui/view%20screen/components/primary_btn.dart';

import '../../../../data/const/export.dart';
import '../../../../data/utils/responsive.dart';

class ProjectCard extends StatelessWidget {
  const ProjectCard({
    super.key,
    required this.data,
    required this.index,
    this.prevPress,
    this.nextPress,
    required this.linkTap,
  });

  final List data;
  final int index;
  final Function()? prevPress, nextPress;
  final Function() linkTap;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.network(
          data[index]['image'] ?? '',
          height: 200,
          width: double.infinity,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      data[index]['title'] ?? '',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      data[index]['subtitle'] ?? '',
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
              kIsWeb && Responsive.isMobile(context)
                  ? Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        IconButton(
                            onPressed: prevPress,
                            icon: Icon(
                              Icons.arrow_back_ios_outlined,
                              size: 15,
                            )),
                        IconButton(
                            onPressed: nextPress,
                            icon: Icon(
                              Icons.arrow_forward_ios_outlined,
                              size: 15,
                            )),
                      ],
                    ),
                    PrimaryButton(
                      text: 'Link',
                      onTap: linkTap,
                    ),
                  ],
                ),
              )
                  : PrimaryButton(
                text: 'Link',
                onTap: linkTap,
              )
            ],
          ),
        ),
      ],
    );
  }
}