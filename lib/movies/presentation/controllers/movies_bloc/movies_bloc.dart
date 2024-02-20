import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_app/core/domain/entities/media.dart';
import 'package:movie_app/core/domain/usecase/base_use_case.dart';
import 'package:movie_app/core/utils/enums.dart';
import 'package:movie_app/movies/data/domain/usecases/get_movies_usecase.dart';

part 'movies_event.dart';
part 'movies_state.dart';

class MoviesBloc extends Bloc<MoviesEvent, MoviesState> {
  final GetMoviesUseCase _getMoviesUseCase;

  MoviesBloc(this._getMoviesUseCase) : super(const MoviesState()) {
    on<GetMoviesEvent>(_getMovies);
  }

  Future<void> _getMovies(
      GetMoviesEvent event, Emitter<MoviesState> emit) async {
    emit(
      state.copyWith(status: RequestStatus.loading),
    );
    final result = await _getMoviesUseCase(const NoParameters());
    result.fold(
      (l) =>
          emit(state.copyWith(status: RequestStatus.error, message: l.message)),
      (r) => emit(
        state.copyWith(status: RequestStatus.loaded, movies: r),
      ),
    );
  }
}
