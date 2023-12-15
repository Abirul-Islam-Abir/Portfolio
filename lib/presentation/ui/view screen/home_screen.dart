import 'package:cloud_firestore/cloud_firestore.dart';
  import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import '../../../data/const/export.dart';
import '../../../data/const/dummy_social_logo.dart';
import '../../../data/utils/responsive.dart';
import 'components/build_carousel_list.dart';
import 'components/carousel_builder.dart';
import 'components/download_cv_btn.dart';
import 'components/platform_skills.dart';
import 'components/portfolio_background.dart';
import 'components/primary_btn.dart';
import 'components/project_view.dart';
import 'components/see_more_button.dart';
import 'components/signature.dart';
import 'components/social_logo_with_text.dart';
import 'components/tab_gridview_builder.dart';
import 'components/user_identity.dart';
import 'components/web_gridview_builder.dart';
import 'components/welcome_text.dart';
import 'components/what_i_can_do.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;

  final Stream<QuerySnapshot> _usersStream =
      FirebaseFirestore.instance.collection('portfolio').snapshots();
  late String downloadURL;
  Future<void> downloadFile(String filePath) async {
    try {
      // Create a reference to the image file you want to download
      firebase_storage.Reference ref =
          firebase_storage.FirebaseStorage.instance.ref(filePath);

      // Get the download URL
      downloadURL = await ref.getDownloadURL();

      // Now you can use the download URL to display the image using an Image widget
      // For example, using the Image.network widget:
      // Image.network(downloadURL);

      print('Image download URL: $downloadURL');
    } catch (e) {
      print('Error downloading image: $e');
    }
  }

  @override
  void initState() {
    downloadFile('/portfolio/abir/user_image/craftybay.png');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // final controller =  Get.put(HomeScreenController());
    return PortfolioBackground(
      child: StreamBuilder<QuerySnapshot>(
          stream: _usersStream,
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasError) {
              return Scaffold(body: Center(child: CircularProgressIndicator()));
            }
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Scaffold(body: Center(child: CircularProgressIndicator()));
            }
            // print(snapshot.data!.docs[0]['dummyPlatformData']);
            return Scaffold(
              drawer: Responsive.isMobile(context)
                  ? const Drawer()
                  : Responsive.isTablet(context)
                      ? const Drawer()
                      : null,
              appBar: Responsive.isMobile(context)
                  ? AppBar(
                      actions: [
                        Signature(),
                      ],
                    )
                  : Responsive.isTablet(context)
                      ? AppBar(
                          actions: [
                            Signature(),
                          ],
                        )
                      : AppBar(
                          title: const Signature(),
                          actions: [
                            PrimaryButton(
                              text: 'Home',
                              onTap: () {},
                            ),
                            PrimaryButton(
                              text: 'Service',
                              onTap: () {},
                            ),
                            PrimaryButton(
                              text: 'Works',
                              onTap: () {},
                            ),
                            PrimaryButton(
                              text: 'Contact',
                              onTap: () {},
                            ),
                            SizedBox(width: 10.w)
                          ],
                        ),
              body: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: Responsive.isMobile(context) ? 0 : 10.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const WelcomeText(
                          text: 'Hi There,Welcome To my Space',
                          image: 'assets/gif/hi.gif'),
                      SizedBox(height: 2.w),
                      UserIdentity(
                          text: '${snapshot.data!.docs[0]['user_name']}',
                          a: '${snapshot.data!.docs[0]['user_text_a']}',
                          b: '${snapshot.data!.docs[0]['user_text_b']}',
                          c: '${snapshot.data!.docs[0]['user_text_c']}',
                          img: '${snapshot.data!.docs[0]['user_image']}'),
                      SizedBox(height: 2.w),
                      DummyText('${snapshot.data!.docs[0]['dummy_text_a']}',
                          align: TextAlign.left),
                      SizedBox(height: 5.w),
                      DownloadCvButton(
                          text: 'Download CV',
                          onTap: () {
                            //  controller.myStringList[0];
                          }),
                      SizedBox(height: 5.w),
                      const HeadlineText('What I can do?'),
                      SizedBox(height: 2.w),
                      DummyText('${snapshot.data!.docs[0]['dummy_text_b']}'),
                      SizedBox(height: 2.w),
                      Responsive.isMobile(context)
                          ? CarouselBuilder(
                              initialPage: selectedIndex,
                              items: buildCarouselList(
                                  data: snapshot.data!.docs[0]
                                      ['dummyPlatformData']),
                              onPage: (index, onPage) {
                                setState(() {
                                  selectedIndex = index;
                                });
                              })
                          : Responsive.isTablet(context)
                              ? TabGridViewBuilder(
                                  data: snapshot.data!.docs[0]
                                      ['dummyPlatformData'])
                              : WebGridViewBuilder(
                                  data: snapshot.data!.docs[0]
                                      ['dummyPlatformData']),
                      SizedBox(height: 5.h),
                      const HeadlineText('Projects'),
                      SizedBox(height: 3.h),
                      DummyText('${snapshot.data!.docs[0]['dummy_text_c']}'),
                      const SizedBox(height: 40),
                      ProjectsView(
                          data: snapshot.data!.docs[0]['dummyProjectData']),
                      SizedBox(height: 3.h),
                      SeeMoreButton(onTap: () {}, text: 'See more'),
                      SizedBox(height: 5.h),
                      const HeadlineText('Get In Touch'),
                      SizedBox(height: 2.w),
                      DummyText('${snapshot.data!.docs[0]['dummy_text_d']}'),
                      SizedBox(height: 5.h),
                      SocialLogoWithTextCard(
                          headline: 'Let\'s try my service now!',
                          subtitle:
                              'Let\'s work together and make everything super cute and super usefully',
                          startedTap: () {},
                          logo: dummySocialLogoData),
                      const SizedBox(height: 40),
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }
}




