import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_app/core/domain/entities/media_details.dart';
import 'package:movie_app/core/utils/enums.dart';
import 'package:movie_app/movies/data/domain/usecases/get_movie_details_usecase.dart';

part 'movie_details_event.dart';
part 'movie_details_state.dart';

class MovieDetailsBloc extends Bloc<MovieDetailsEvent, MovieDetailsState> {
  final GetMovieDetailsUseCase _getMovieDetailsUseCase;

  MovieDetailsBloc(this._getMovieDetailsUseCase) : super(MovieDetailsState()) {
    on<GetMovieDetailsEvent>(_getMovieDetails);
  }

  Future<void> _getMovieDetails(
      GetMovieDetailsEvent event, Emitter<MovieDetailsState> emit) async {
    emit(state.copyWith(status: RequestStatus.loading));
    final result = await _getMovieDetailsUseCase.call(event.id);
    result.fold(
        (l) => emit(
            state.copyWith(status: RequestStatus.error, message: l.message)),
        (r) => emit(
            state.copyWith(status: RequestStatus.loaded, movieDetails: r)));
  }
}
