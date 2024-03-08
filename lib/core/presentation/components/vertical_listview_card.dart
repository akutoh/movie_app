import 'package:flutter/material.dart';
import 'package:movie_app/core/domain/entities/media.dart';
import 'package:movie_app/core/presentation/components/image_with_shimmer.dart';
import 'package:movie_app/core/resources/app_colors.dart';
import 'package:movie_app/core/resources/app_values.dart';

class VerticalListviewCard extends StatelessWidget {
  const VerticalListviewCard({super.key, required this.media});

  final Media media;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Container(
      height: AppSize.s175,
      margin: const EdgeInsets.symmetric(
          horizontal: AppPadding.p16, vertical: AppPadding.p10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppSize.s10),
          color: AppColors.secondaryBackground),
      child: Row(
        children: [
          ClipRRect(
            child: ImageWithShimmer(
                imageUrl: media.posterUrl,
                height: double.infinity,
                width: AppSize.s110),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  media.title,
                  style: textTheme.titleSmall,
                  overflow: TextOverflow.ellipsis,
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: AppMargin.m10),
                      child: Text(
                        media.releaseDate,
                        style: textTheme.bodyLarge,
                      ),
                    ),
                    const Icon(
                      Icons.star_rate_rounded,
                      size: AppSize.s18,
                      color: AppColors.ratingIconColor,
                    ),
                    Text(
                      media.voteAverage.toString(),
                      style: textTheme.bodyLarge,
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: AppPadding.p12),
                  child: Text(
                    media.overview,
                    overflow: TextOverflow.ellipsis,
                    style: textTheme.bodyLarge,
                    maxLines: 2,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
