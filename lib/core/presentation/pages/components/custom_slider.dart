// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/core/resources/app_constants.dart';

class CustomSlider extends StatelessWidget {
  final Widget Function(BuildContext context, int itemIndex, int) itemBuilder;
  const CustomSlider({
    super.key,
    required this.itemBuilder,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return CarouselSlider.builder(
      itemCount: AppConstants.carouselSliderItemsCount,
      itemBuilder: itemBuilder,
      options: CarouselOptions(
        viewportFraction: 1,
        height: size.height * 0.55,
        autoPlay: true,
      ),
    );
  }
}
