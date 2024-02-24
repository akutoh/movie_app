part of 'popular_tv_shows_bloc.dart';

sealed class PopularTvShowsState extends Equatable {
  const PopularTvShowsState();
  
  @override
  List<Object> get props => [];
}

final class PopularTvShowsInitial extends PopularTvShowsState {}
