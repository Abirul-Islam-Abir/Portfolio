import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_sizer/flutter_sizer.dart';

import '../../../data/const/export.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return PortfolioBackground(
      child: Scaffold(
        drawer: Drawer(),
        appBar: AppBar(
          actions: [Text('< Abir />')],
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Stack(
            children: [
              Scrollbar(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 20),
                      WelcomeText(
                          text: 'Hi There,Welcome To my Space',
                          image: 'assets/gif/hi.gif'),
                      SizedBox(height: 20),
                      UserName('I\'m Abirul Islam Abir,'),
                      SizedBox(height: 20),
                      AnimatedTextShow(
                          a: 'As a Flutter Frontend Developer',
                          b: 'Mobile Application Developer',
                          c: 'Ui/Ux Designer Ios,android,web'),
                      SizedBox(height: 20),
                      Text('Freelancer providing services for programming '
                          'and design content needs.Join me down below '
                          'and let\'s get started'),
                      SizedBox(height: 20),
                      DownloadCvButton(text: 'Download CV', onTap: () {}),
                      SizedBox(height: 40),
                      WhatICanDoText('What I can do?'),
                      SizedBox(height: 10),
                      DummyText(
                          'Since the begginig of my journey as a Freelanc designer and'
                          'developer.I\'v worked startups and collaborated with'
                          'talented people to create digital products for both'
                          'business and consumer use.I offer a'
                          'wide range of services including brand design,programming '
                          'and teaching.'),
                      SizedBox(height: 40),
                      CarouselBuilder(items: [
                        Container(
                            decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.circular(20)),
                            height: 220,
                            width: double.infinity,
                            child: Center(child: Text('Hellow')))
                      ], onPage: (index, onPage) {}),
                    ],
                  ),
                ),
              ),
              Positioned(
                  top: 50,right: 20,
                  child: Container(
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(30)),
                    height: 50,width: 50,child: Image.asset('assets/images/image1.png'),))
            ],
          ),
        ),
      ),
    );
  }
}

