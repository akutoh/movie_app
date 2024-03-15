import 'package:dartz/dartz.dart';
import 'package:movie_app/core/data/error/failure.dart';
import 'package:movie_app/core/domain/usecase/base_use_case.dart';
import 'package:movie_app/watchlist/domain/repository/watchlist_repository.dart';

class RemoveWatchlistItemsUseCase extends BaseUseCase<Unit, int> {

  final WatchlistRepository _baseWatchlistRepository;

  RemoveWatchlistItemsUseCase(this._baseWatchlistRepository);

  @override
  Future<Either<Failure, Unit>> call(int p) async {
    return _baseWatchlistRepository.removeWatchListItem(p);
  }
  
}