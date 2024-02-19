// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:movie_app/core/domain/entities/media.dart';
import 'package:movie_app/core/presentation/pages/components/custom_slider.dart';
import 'package:movie_app/core/presentation/pages/components/section_listview.dart';
import 'package:movie_app/core/resources/app_routes.dart';
import 'package:movie_app/core/resources/app_strings.dart';
import 'package:movie_app/core/resources/app_values.dart';
import 'package:movie_app/core/resources/section_header.dart';
import 'package:movie_app/core/resources/section_listview_card.dart';
import 'package:movie_app/core/resources/slider_card.dart';

class MoviesView extends StatelessWidget {
  const MoviesView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.pink,
      body: MoviesWidget(nowPlayingMovies: [], popularMovies: [], topRatedMovies: [],),
    );
  }
}

class MoviesWidget extends StatelessWidget {
  final List<Media> nowPlayingMovies;
  final List<Media> popularMovies;
  final List<Media> topRatedMovies;

  const MoviesWidget({
    super.key,
    required this.nowPlayingMovies,
    required this.popularMovies,
    required this.topRatedMovies,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomSlider(
            itemBuilder: (context, itemIndex, _) {
              return SliderCard(
                media: nowPlayingMovies[itemIndex],
                itemIndex: itemIndex,
              );
            },
          ),
          SectionHeader(
            title: AppStrings.popularMovies,
            onSeeAllTap: () {
              context.goNamed(AppRoutes.popularMoviesRoute);
            },
          ),
          SectionListView(
            itemCount: popularMovies.length,
            height: AppSize.s240,
            itemBuilder: (context, index) {
              return SectionListViewCard(media: popularMovies[index]);
            },
          ),
          SectionHeader(
            title: AppStrings.topRatedMovies,
            onSeeAllTap: () {
              context.goNamed(AppRoutes.topRatedMoviesRoute);
            },
          ),
          SectionListView(
            height: AppSize.s240,
            itemCount: topRatedMovies.length,
            itemBuilder: (context, index) {
              return SectionListViewCard(media: topRatedMovies[index]);
            },
          ),
        ],
      ),
    );
  }
}
