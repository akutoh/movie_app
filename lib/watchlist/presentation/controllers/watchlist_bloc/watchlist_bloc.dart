import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:movie_app/core/domain/entities/media.dart';
import 'package:movie_app/core/domain/usecase/base_use_case.dart';
import 'package:movie_app/watchlist/domain/usecases/add_watchlist_item_usecase.dart';
import 'package:movie_app/watchlist/domain/usecases/check_if_item_added_usecase.dart';
import 'package:movie_app/watchlist/domain/usecases/get_watchlist_items_usecase.dart';
import 'package:movie_app/watchlist/domain/usecases/remove_watchlist_item_usecase.dart';

part 'watchlist_event.dart';
part 'watchlist_state.dart';

class WatchlistBloc extends Bloc<WatchlistEvent, WatchlistState> {
  WatchlistBloc(
    this._getWatchlistItemsUseCase,
    this._addWatchlistItemUseCase,
    this._removeWatchlistItemsUseCase,
    this._checkIfItemAddedUseCase,
  ) : super(const WatchlistState()) {
    on<WatchlistEvent>((event, emit) {
      // TODO: implement event handler
    });
  }

  final GetWatchlistItemsUseCase _getWatchlistItemsUseCase;
  final AddWatchlistItemUseCase _addWatchlistItemUseCase;
  final RemoveWatchlistItemsUseCase _removeWatchlistItemsUseCase;
  final CheckIfItemAddedUseCase _checkIfItemAddedUseCase;

  Future<void> _getWatchListItems(
      WatchlistEvent event, Emitter<WatchlistState> emit) async {
    emit(
      const WatchlistState(status: WatchlistRequestStatus.loading),
    );
    final result = await _getWatchlistItemsUseCase.call(const NoParameters());
    result.fold(
        (l) => emit(WatchlistState(
            status: WatchlistRequestStatus.error, message: l.message)),
        (r) => {
              if (r.isEmpty)
                {
                  emit(
                    const WatchlistState(status: WatchlistRequestStatus.empty),
                  )
                }
              else
                {
                  emit(
                    WatchlistState(
                        status: WatchlistRequestStatus.loaded, items: r),
                  )
                }
            });
  }

  Future<void> _addWatchlistItem(
      AddWatchListItemEvent event, Emitter<WatchlistState> emit) async {
    emit(
      const WatchlistState(status: WatchlistRequestStatus.loading),
    );
    final result = await _addWatchlistItemUseCase.call(event.media);
    result.fold(
        (l) => WatchlistState(
            status: WatchlistRequestStatus.error, message: l.message),
        (r) => emit(
            WatchlistState(status: WatchlistRequestStatus.itemAdded, id: r)));
  }

  Future<void> _removeWatchlistItem(
      RemoveWatchListItemEvent event, Emitter<WatchlistState> emit) async {
    emit(const WatchlistState(status: WatchlistRequestStatus.loading));
    final result = await _removeWatchlistItemsUseCase.call(event.index);
    result.fold(
      (l) => WatchlistState(
          status: WatchlistRequestStatus.error, message: l.message),
      (r) => const WatchlistState(status: WatchlistRequestStatus.itemRemoved),
    );
  }

  Future<void> _checkIfItemIsAdded(
      CheckIfItemAddedEvent event, Emitter<WatchlistState> emit) async {
    emit(const WatchlistState(status: WatchlistRequestStatus.loading));
    final result = await _checkIfItemAddedUseCase.call(event.tmdbID);
    result.fold(
      (l) => WatchlistState(
          status: WatchlistRequestStatus.error, message: l.message),
      (r) => WatchlistState(status: WatchlistRequestStatus.isItemAdded, id: r),
    );
  }
}
