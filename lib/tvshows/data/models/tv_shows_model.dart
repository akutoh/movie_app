// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:movie_app/core/domain/entities/media.dart';
import 'package:movie_app/core/utils/functions.dart';

class TvShowsModel extends Media {
  const TvShowsModel(
      {required super.tmdbID,
      required super.title,
      required super.posterUrl,
      required super.backdropUrl,
      required super.voteAverage,
      required super.releaseDate,
      required super.overview,
      required super.isMovie});

  factory TvShowsModel.fromJson(Map<String, dynamic> json) {
    return TvShowsModel(
      tmdbID: json['id'],
      title: json['name'],
      posterUrl: getPosterUrl(json['poster_path']),
      backdropUrl: getBackdropUrl(json['backdrop_path']),
      voteAverage: double.parse((json['vote_average']).toStringAsFixed(1)),
      releaseDate: getDate(json['first_air_date']),
      overview: json['overview'],
      isMovie: false,
    );
  }
}
