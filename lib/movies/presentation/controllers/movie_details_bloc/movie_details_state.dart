// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'movie_details_bloc.dart';

class MovieDetailsState {
  final MediaDetails? movieDetails;
  final RequestStatus status;
  final String message;

  MovieDetailsState({this.movieDetails, this.status = RequestStatus.loading, this.message = ''});

  MovieDetailsState copyWith({
    MediaDetails? movieDetails,
    RequestStatus? status,
    String? message,
  }) {
    return MovieDetailsState(
      movieDetails: movieDetails ?? this.movieDetails,
      status: status ?? this.status,
      message: message ?? this.message,
    );
  }
}

