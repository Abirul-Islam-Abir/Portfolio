import 'package:get/get.dart';
import 'package:portfolio/presentation/ui/view%20screen/components/platform_skills.dart';

import '../../../../data/const/export.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../../../data/utils/responsive.dart';

class ProjectsView extends StatelessWidget {
  ProjectsView({
    super.key,
    required this.data,
  });

  final List data;

  @override
  Widget build(BuildContext context) {
    return Responsive.isMobile(context)
        ? PageViewBuilder(data: data)
        : Text('');
  }
}

class PageViewBuilder extends StatelessWidget {
  const PageViewBuilder({
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
          height: 300,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CachedImage(
                image: data[index]['image'] ?? '',
                height: 250,
                width: double.infinity,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          data[index]['title'] ?? '',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          data[index]['subtitle'] ?? '',
                        ),
                      ],
                    ),
                    PrimaryButton(
                        text: 'Link Here',
                        onTap: () {
                          // print(data[index]['link']);
                        })
                  ],
                ),
              ),
            ],
          ),
        ),
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
