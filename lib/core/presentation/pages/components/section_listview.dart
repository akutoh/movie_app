// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:movie_app/core/resources/app_values.dart';

class SectionListView extends StatelessWidget {
  final int itemCount;
  final double height;
  final Widget Function(BuildContext context, int index) itemBuilder;

  const SectionListView({
    super.key,
    required this.itemCount,
    required this.height,
    required this.itemBuilder,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: ListView.separated(
          padding: const EdgeInsets.symmetric(horizontal: AppPadding.p16),
          itemBuilder: itemBuilder,
          scrollDirection: Axis.horizontal,
          separatorBuilder: (context, index) => const SizedBox(
                width: AppSize.s10,
              ),
          itemCount: itemCount),
    );
  }
}
