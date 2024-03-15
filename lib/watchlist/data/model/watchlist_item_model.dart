import 'package:movie_app/core/domain/entities/media.dart';

class WatchlistItemModel extends Media {
  const WatchlistItemModel(
      {required super.tmdbID,
      required super.title,
      required super.posterUrl,
      required super.backdropUrl,
      required super.voteAverage,
      required super.releaseDate,
      required super.overview,
      required super.isMovie});

  factory WatchlistItemModel.fromEntity(Media media) {
    return WatchlistItemModel(
        tmdbID: media.tmdbID,
        title: media.title,
        posterUrl: media.posterUrl,
        backdropUrl: media.backdropUrl,
        voteAverage: media.voteAverage,
        releaseDate: media.releaseDate,
        overview: media.overview,
        isMovie: media.isMovie);
  }
}
