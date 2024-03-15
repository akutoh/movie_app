// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'watchlist_bloc.dart';

enum WatchlistRequestStatus {
  empty,
  loading,
  loaded,
  error,
  itemAdded,
  itemRemoved,
  isItemAdded,
}

class WatchlistState extends Equatable {
  final int? id;
  final List<Media> items;
  final WatchlistRequestStatus status;
  final String message;

  const WatchlistState({
    this.id,
    this.items = const [],
    this.status = WatchlistRequestStatus.loading,
    this.message = '',
  });

  WatchlistState copyWith({
    int? id,
    List<Media>? items,
    WatchlistRequestStatus? status,
    String? message,
  }) {
    return WatchlistState(
      id: id ?? this.id,
      items: items ?? this.items,
      status: status ?? this.status,
      message: message ?? this.message,
    );
  }

  @override
  List<Object?> get props => [id, items, status, message];
}
