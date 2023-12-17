import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter_svg/svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../data/const/export.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class PlatformSkills extends StatelessWidget {
  const PlatformSkills({
    super.key,
    required this.image,
    required this.title,
    required this.subtitle,
    required this.a,
    required this.b,
    required this.c,
    required this.d,
  });
  final String image;
  final String title, subtitle, a, b, c, d;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        decoration: BoxDecoration(
            border: Border.all(width: 01, color: Colors.red),
            borderRadius: BorderRadius.circular(20)),
        height: 250,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            CachedImage(image: image),
            AutoSizeText(title,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
                maxLines: 1),
            AutoSizeText(
              subtitle,
              textAlign: TextAlign.center,
            ),
            SizedBox(
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      a,
                      textAlign: TextAlign.start,
                    ),
                    Text(
                      b,
                      textAlign: TextAlign.start,
                    ),
                    Text(
                      c,
                      textAlign: TextAlign.start,
                    ),
                    Text(
                      d,
                      textAlign: TextAlign.start,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CachedImage extends StatelessWidget {
  const CachedImage({
    super.key,
    required this.image,
    this.height = 50,
    this.width = 50,
  });

  final String image;

  final double? height;
  final double? width;
  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: image,
      imageBuilder: (context, imageProvider) => Container(
        decoration: BoxDecoration(
          image: DecorationImage(image: imageProvider, fit: BoxFit.cover),
        ),
      ),
      placeholder: (context, url) => SizedBox(
          height: 50,
          width: 50,
          child: Center(child: CircularProgressIndicator())),
      errorWidget: (context, url, error) => Icon(Icons.error),
      height: height,
      width: width,
    );
  }
}
