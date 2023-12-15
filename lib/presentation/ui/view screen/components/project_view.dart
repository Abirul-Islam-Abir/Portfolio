import 'package:get/get.dart';
import 'package:portfolio/presentation/ui/view%20screen/components/platform_skills.dart';
import 'package:portfolio/presentation/ui/view%20screen/components/primary_btn.dart';

import '../../../../data/const/export.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../../../data/utils/responsive.dart';

class ProjectsView extends StatelessWidget {
  ProjectsView({super.key, required this.data});

  final List data;

  @override
  Widget build(BuildContext context) {
    return Responsive.isMobile(context)
        ? ProjectPageViewBuilder(data: data)
        : Responsive.isTablet(context)
            ? TabProjectGridBuilder(data: data)
            : WebProjectGridBuilder(data: data);
  }
}

class WebProjectGridBuilder extends StatelessWidget {
  const WebProjectGridBuilder({
    super.key,
    required this.data,
  });

  final List data;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: GridView.builder(
        itemCount: data.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          mainAxisExtent: 250,
          crossAxisSpacing: 20,
        ),
        itemBuilder: (context, index) => ProjectCard(
          data: data,
          index: index,
        ),
      ),
    );
  }
}

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
      child: GridView.builder(
        itemCount: data.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisExtent: 250,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20),
        itemBuilder: (context, index) => ProjectCard(
          data: data,
          index: index,
        ),
      ),
    );
  }
}

class ProjectPageViewBuilder extends StatelessWidget {
  const ProjectPageViewBuilder({
    super.key,
    required this.data,
  });

  final List data;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: PageView.builder(scrollDirection: Axis.horizontal,
        itemCount: data.length,
        itemBuilder: (context, index) => ProjectCard(
          data: data,
          index: index,
        ),
      ),
    );
  }
}

class ProjectCard extends StatelessWidget {
  const ProjectCard({
    super.key,
    required this.data,
    required this.index,
  });

  final List data;
  final int index;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.network(
            data[index]['image'] ?? '',
            height: 200,
            width: double.infinity,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
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
              PrimaryButton(
                  text: 'Link',
                  onTap: () {
                    // print(data[index]['link']);
                  })
            ],
          ),
        ],
      ),
    );
  }
}

class WebviewScreen extends StatelessWidget {
  WebviewScreen({super.key, required this.url});
  final String url;
  WebViewController controller = WebViewController()
    ..setJavaScriptMode(JavaScriptMode.unrestricted)
    ..setBackgroundColor(const Color(0x00000000))
    ..setNavigationDelegate(
      NavigationDelegate(
        onProgress: (int progress) {
          // Update loading bar.
        },
        onPageStarted: (String url) {},
        onPageFinished: (String url) {},
        onWebResourceError: (WebResourceError error) {},
        onNavigationRequest: (NavigationRequest request) {
          if (request.url.startsWith('https://www.youtube.com/')) {
            return NavigationDecision.prevent;
          }
          return NavigationDecision.navigate;
        },
      ),
    )
    ..loadRequest(Uri.parse('url'));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(child: WebViewWidget(controller: controller)));
  }
}
