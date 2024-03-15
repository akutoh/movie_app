import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/domain/entities/media_details.dart';
import 'package:movie_app/core/presentation/components/details_card.dart';
import 'package:movie_app/core/presentation/components/error_screen.dart';
import 'package:movie_app/core/presentation/components/loading_indicator.dart';
import 'package:movie_app/core/services/service_locator.dart';
import 'package:movie_app/core/utils/enums.dart';
import 'package:movie_app/movies/presentation/components/movie_card_details.dart';
import 'package:movie_app/movies/presentation/controllers/movie_details_bloc/movie_details_bloc.dart';

class MovieDetailsView extends StatelessWidget {
  const MovieDetailsView({super.key, required this.movieId});

  final int movieId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          sl<MovieDetailsBloc>()..add(GetMovieDetailsEvent(movieId)),
      child: Scaffold(
        body: BlocBuilder<MovieDetailsBloc, MovieDetailsState>(
          builder: (context, state) {
            switch (state.status) {
              case RequestStatus.loading:
                return const LoadingIndicator();
              case RequestStatus.loaded:
                return MovieDetailsWidget(mediaDetails: state.movieDetails!);
              case RequestStatus.error:
                return ErrorScreen(onTryAgainPressed: () {
                  context
                      .read<MovieDetailsBloc>()
                      .add(GetMovieDetailsEvent(movieId));
                });
            }
          },
        ),
      ),
    );
  }
}

class MovieDetailsWidget extends StatelessWidget {
  const MovieDetailsWidget({super.key, required this.mediaDetails});

  final MediaDetails mediaDetails;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          DetailsCard(
            mediaDetails: mediaDetails,
            detailsWidget: MovieCardDetails(movieDetails: mediaDetails),
          ),
        ],
      ),
    );
  }
}
