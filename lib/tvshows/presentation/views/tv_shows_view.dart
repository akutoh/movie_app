import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_app/core/domain/entities/media.dart';
import 'package:movie_app/core/presentation/components/custom_slider.dart';
import 'package:movie_app/core/presentation/components/loading_indicator.dart';
import 'package:movie_app/core/presentation/components/section_header.dart';
import 'package:movie_app/core/presentation/components/section_listview.dart';
import 'package:movie_app/core/presentation/components/section_listview_card.dart';
import 'package:movie_app/core/presentation/components/slider_card.dart';
import 'package:movie_app/core/resources/app_routes.dart';
import 'package:movie_app/core/resources/app_strings.dart';
import 'package:movie_app/core/resources/app_values.dart';
import 'package:movie_app/core/services/service_locator.dart';
import 'package:movie_app/core/utils/enums.dart';
import 'package:movie_app/tvshows/presentation/controllers/tv_shows_bloc/tv_shows_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TVShowsView extends StatelessWidget {
  const TVShowsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<TvShowsBloc>()..add(GetTVShowsEvent()),
      child: Scaffold(
        backgroundColor: Colors.green,
        body: BlocBuilder<TvShowsBloc, TvShowsState>(
          builder: (context, state) {
            switch (state.status) {
              case RequestStatus.loading:
                return const LoadingIndicator();
              case RequestStatus.loaded:
                return TVShowsWidget(
                  onAirTvShows: state.tvShows[0],
                  popularTvShows: state.tvShows[1],
                  topRatedTvShows: state.tvShows[2],
                );
              case RequestStatus.error:
                return Text(state.message);
            }
          },
        ),
      ),
    );
  }
}

class TVShowsWidget extends StatelessWidget {
  final List<Media> onAirTvShows;
  final List<Media> popularTvShows;
  final List<Media> topRatedTvShows;

  const TVShowsWidget({
    super.key,
    required this.onAirTvShows,
    required this.popularTvShows,
    required this.topRatedTvShows,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomSlider(
            itemBuilder: (context, itemIndex, p2) {
              return SliderCard(
                  media: onAirTvShows[itemIndex], itemIndex: itemIndex);
            },
          ),
          SectionHeader(
            title: AppStrings.popularShows,
            onSeeAllTap: () {
              context.goNamed(AppRoutes.popularMoviesRoute);
            },
          ),
          SectionListView(
            itemCount: popularTvShows.length,
            height: AppSize.s240,
            itemBuilder: (context, index) {
              return SectionListViewCard(
                media: popularTvShows[index],
              );
            },
          ),
          SectionHeader(
            title: AppStrings.topRatedShows,
            onSeeAllTap: () {
              context.goNamed(AppRoutes.topRatedTvShowsRoute);
            },
          ),
          SectionListView(
            itemCount: topRatedTvShows.length,
            height: AppSize.s240,
            itemBuilder: (context, index) {
              return SectionListViewCard(
                media: topRatedTvShows[index],
              );
            },
          ),
        ],
      ),
    );
  }
}
