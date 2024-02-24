import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'popular_tv_shows_event.dart';
part 'popular_tv_shows_state.dart';

class PopularTvShowsBloc extends Bloc<PopularTvShowsEvent, PopularTvShowsState> {
  PopularTvShowsBloc() : super(PopularTvShowsInitial()) {
    on<PopularTvShowsEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
