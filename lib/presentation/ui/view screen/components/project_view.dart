import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:portfolio/presentation/ui/view%20screen/components/platform_skills.dart';
import 'package:portfolio/presentation/ui/view%20screen/components/primary_btn.dart';
import 'package:portfolio/presentation/ui/view%20screen/components/project_card.dart';
import 'package:portfolio/presentation/ui/view%20screen/components/project_pageview_builder.dart';
import 'package:portfolio/presentation/ui/view%20screen/components/tab_project_builder.dart';
import 'package:portfolio/presentation/ui/view%20screen/components/web_project_builder.dart';

import '../../../../data/const/export.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../../../data/utils/responsive.dart';
import 'build_project_carousel_option.dart';

class ProjectsView extends StatefulWidget {
  ProjectsView({super.key, required this.data});

  final List data;

  @override
  State<ProjectsView> createState() => _ProjectsViewState();
}

class _ProjectsViewState extends State<ProjectsView> {
  int initialPage = 0;
  @override
  Widget build(BuildContext context) {
    return Responsive.isMobile(context)
        ? ProjectCarouselBuilder(
            items: buildProjectCarouselOption(data: widget.data),
            initialPage: initialPage,
            onPage: (index, page) {
              setState(() {
                initialPage = index;
              });
            },
          )
        : Responsive.isTablet(context)
            ? TabProjectGridBuilder(data: widget.data)
            : WebProjectGridBuilder(data: widget.data);
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
