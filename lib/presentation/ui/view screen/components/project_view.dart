
import '../../../../data/const/export.dart';

class ProjectsView extends StatelessWidget {
  const ProjectsView({
    super.key,
    required this.data,
  });

  final List data;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: PageView.builder(
        itemCount: data.length,
        itemBuilder: (context, index) => SizedBox(
          width: double.infinity,
          child: Image.asset('${data[index]}'),
        ),
      ),
    );
  }
}
