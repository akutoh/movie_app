import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_app/core/domain/entities/media.dart';
import 'package:movie_app/core/domain/usecase/base_use_case.dart';
import 'package:movie_app/core/utils/enums.dart';
import 'package:movie_app/tvshows/domain/usecase/get_tv_shows_use_case.dart';

part 'tv_shows_event.dart';
part 'tv_shows_state.dart';

class TvShowsBloc extends Bloc<TvShowsEvent, TvShowsState> {
  final GetTvShowsUseCase _getTvShowsUseCase;

  TvShowsBloc(this._getTvShowsUseCase) : super(const TvShowsState()) {
    on<TvShowsEvent>(_getTvShows);
  }

  Future<void> _getTvShows(
      TvShowsEvent event, Emitter<TvShowsState> emit) async {
    emit(const TvShowsState(status: RequestStatus.loading));
    final result = await _getTvShowsUseCase(const NoParameters());
    result.fold(
      (l) => emit(const TvShowsState(status: RequestStatus.error)),
      (r) => emit(
        TvShowsState(status: RequestStatus.loaded, tvShows: r),
      ),
    );
  }
}
