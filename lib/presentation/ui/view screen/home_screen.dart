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

  @override
  Widget build(BuildContext context) {
    return PortfolioBackground(
      child: Scaffold(
        drawer: const Drawer(),
        appBar: Responsive.isMobile(context)
            ? AppBar(
                actions: const [
                  Text('< Abir />'),
                ],
              )
            : null,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20.h),
                const WelcomeText(
                    text: 'Hi There,Welcome To my Space',
                    image: 'assets/gif/hi.gif'),
                const SizedBox(height: 20),
                const UserIdentity(
                    text: 'I\'m Abirul Islam Abir,',
                    a: 'As a Flutter Frontend Developer',
                    b: 'Mobile Application Developer',
                    c: 'Ui/Ux Designer Ios,android,web',
                    img: 'assets/images/image1.png'),
                const SizedBox(height: 20),
                const Text('Freelancer providing services for programming '
                    'and design content needs.Join me down below '
                    'and let\'s get started'),
                const SizedBox(height: 20),
                DownloadCvButton(text: 'Download CV', onTap: () {}),
                const SizedBox(height: 40),
                const HeadlineText('What I can do?'),
                const SizedBox(height: 10),
                const DummyText(
                    'Since the begginig of my journey as a Freelanc designer and'
                    'developer.I\'v worked startups and collaborated with'
                    'talented people to create digital products for both'
                    'business and consumer use.I offer a'
                    'wide range of services including brand design,programming '
                    'and teaching.'),
                const SizedBox(height: 40),
                CarouselBuilder(
                    initialPage: selectedIndex,
                    items:
                        buildCarouselList(dummyPlatformData: dummyPlatformData),
                    onPage: (index, onPage) {
                      setState(() {
                        selectedIndex = index;
                      });
                    }),
                const SizedBox(height: 60),
                const HeadlineText('Projects'),
                const DummyText(
                    'Since the begining of my journey as a Developer and designer '
                    'I\'v created digital products for business and consumer '
                    'to use.This is a little bit'),
                const SizedBox(height: 40),
                ProjectsView(data: dummyProjectsData),
                const SizedBox(height: 20),
                SeeMoreButton(onTap: () {}, text: 'See more'),
                const SizedBox(height: 20),
                const HeadlineText('Get In Touch'),
                const DummyText(
                    'If you want to avail my service if you contact me at the link below'),
                const SizedBox(height: 40),
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
      ),
    );
  }
}
