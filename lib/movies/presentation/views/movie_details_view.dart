import 'package:flutter/material.dart';
import 'package:movie_app/core/domain/entities/media_details.dart';
import 'package:movie_app/core/presentation/components/details_card.dart';
import 'package:movie_app/movies/presentation/components/movie_card_details.dart';

class MovieDetailsView extends StatelessWidget {
  const MovieDetailsView({super.key, required this.movieId});

  final int movieId;

  @override
  Widget build(BuildContext context) {
    final MediaDetails details = MediaDetails(
        tmdbID: 1072790,
        title: 'Land of Bad',
        posterUrl: '/h27WHO2czaY5twDmV3Wfx5IdqoE.jpg',
        backdropUrl: '/oBIQDKcqNxKckjugtmzpIIOgoc4.jpg',
        releaseDate: '2024-01-25',
        genres: 'genres',
        overview: 'overview',
        voteAverage: 2,
        voteCount: 'voteCount',
        trailerUrl: 'trailerUrl');
    
    return MovieDetailsWidget(
      mediaDetails: details,
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
