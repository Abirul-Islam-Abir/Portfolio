import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:portfolio/presentation/state%20holder%20controller/home_screen_controller.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../data/const/export.dart';
import '../../../data/const/dummy_platform_data.dart';
import '../../../data/const/dummy_projects_data.dart';
import '../../../data/const/dummy_social_logo.dart';
import '../../../data/utils/responsive.dart';
import 'components/build_carousel_list.dart';
import 'components/carousel_builder.dart';
import 'components/download_cv_btn.dart';
import 'components/platform_skills.dart';
import 'components/portfolio_background.dart';
import 'components/project_view.dart';
import 'components/see_more_button.dart';
import 'components/social_logo_with_text.dart';
import 'components/user_identity.dart';
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

  @override
  Widget build(BuildContext context) {
    return PortfolioBackground(
      child: StreamBuilder<QuerySnapshot>(
          stream: _usersStream,
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasError) {
              return Text('Something went wrong');
            }
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Text("Loading");
            }
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
                      DownloadCvButton(text: 'Download CV', onTap: () {}),
                      SizedBox(height: 5.w),
                      const HeadlineText('What I can do?'),
                      SizedBox(height: 2.w),
                      DummyText('${snapshot.data!.docs[0]['dummy_text_b']}'),
                      SizedBox(height: 2.w),
                      Responsive.isMobile(context)
                          ? CarouselBuilder(
                              initialPage: selectedIndex,
                              items: buildCarouselList(
                                  dummyPlatformData: dummyPlatformData),
                              onPage: (index, onPage) {
                                setState(() {
                                  selectedIndex = index;
                                });
                              })
                          : Responsive.isTablet(context)
                              ? Container(
                                  height: 600,
                                  child: GridView.builder(
                                    shrinkWrap: true,
                                    physics: NeverScrollableScrollPhysics(),
                                    itemCount: dummyPlatformData.length,
                                    gridDelegate:
                                        SliverGridDelegateWithFixedCrossAxisCount(
                                            crossAxisCount: 2,
                                            mainAxisExtent: 250,
                                            crossAxisSpacing: 20,
                                            mainAxisSpacing: 20),
                                    itemBuilder: (context, index) =>
                                        PlatformSkills(
                                      skill: dummyPlatformData[index]['skill'],
                                      image: dummyPlatformData[index]['image'],
                                      title: dummyPlatformData[index]['title'],
                                      subtitle: dummyPlatformData[index]
                                          ['subtitle'],
                                    ),
                                  ),
                                )
                              : Container(
                                  height: 350,
                                  child: GridView.builder(
                                    shrinkWrap: true,
                                    physics: NeverScrollableScrollPhysics(),
                                    itemCount: dummyPlatformData.length,
                                    gridDelegate:
                                        SliverGridDelegateWithFixedCrossAxisCount(
                                            crossAxisCount: 4,
                                            mainAxisExtent: 300,
                                            crossAxisSpacing: 10),
                                    itemBuilder: (context, index) =>
                                        PlatformSkills(
                                      skill: dummyPlatformData[index]['skill'],
                                      image: dummyPlatformData[index]['image'],
                                      title: dummyPlatformData[index]['title'],
                                      subtitle: dummyPlatformData[index]
                                          ['subtitle'],
                                    ),
                                  ),
                                ),
                      SizedBox(height: 5.h),
                      const HeadlineText('Projects'),
                      SizedBox(height: 3.h),
                      DummyText('${snapshot.data!.docs[0]['dummy_text_c']}'),
                      const SizedBox(height: 40),
                      ProjectsView(data: dummyProjectsData),
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

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    super.key,
    required this.text,
    required this.onTap,
  });
  final String text;
  final Function() onTap;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        onPressed: onTap,
        child: Text(text),
      ),
    );
  }
}

class Signature extends StatelessWidget {
  const Signature({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      '< Abir />',
      style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.bold),
    );
  }
}
