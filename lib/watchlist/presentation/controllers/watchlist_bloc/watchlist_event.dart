part of 'watchlist_bloc.dart';

abstract class WatchlistEvent extends Equatable {
  const WatchlistEvent();
}

class GetWatchListItemsEvent extends WatchlistEvent {
  @override
  List<Object?> get props => [];
}

class AddWatchListItemEvent extends WatchlistEvent {
  final Media media;

  const AddWatchListItemEvent({
    required this.media,
  });

  @override
  List<Object?> get props => [media];
}

class RemoveWatchListItemEvent extends WatchlistEvent {
  final int index;

  const RemoveWatchListItemEvent({required this.index});

  @override
  List<Object?> get props => [index];
}

class CheckIfItemAddedEvent extends WatchlistEvent {
  final int tmdbID;

  const CheckIfItemAddedEvent({required this.tmdbID});

  @override
  List<Object?> get props => [tmdbID];
}
