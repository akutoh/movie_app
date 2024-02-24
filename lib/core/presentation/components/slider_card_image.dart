// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:movie_app/core/resources/app_colors.dart';
import 'package:movie_app/core/presentation/components/image_with_shimmer.dart';

class SliderCardImage extends StatelessWidget {
  final String imageUrl;
  const SliderCardImage({
    super.key,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return ShaderMask(
      blendMode: BlendMode.dstIn,
      shaderCallback: (bounds) {
        return const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            AppColors.black,
            AppColors.black,
            AppColors.transparent,
          ],
          stops: [0.3, 0.5, 1],
        ).createShader(
          Rect.fromLTRB(0, 0, bounds.width, bounds.height),
        );
      },
      child: ImageWithShimmer(
        imageUrl: imageUrl,
        height: size.height * 0.6,
        width: double.infinity,
      ),
    );
  }
}
