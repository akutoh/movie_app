import 'package:dartz/dartz.dart';
import 'package:movie_app/core/data/error/failure.dart';
import 'package:movie_app/core/domain/entities/media.dart';
import 'package:movie_app/core/domain/usecase/base_use_case.dart';
import 'package:movie_app/tvshows/domain/repository/tv_shows_repository.dart';

class GetTvShowsUseCase extends BaseUseCase<List<List<Media>>, NoParameters> {

  final TvShowsRepository _baseTvShowsRepository;

  GetTvShowsUseCase(this._baseTvShowsRepository);

  @override
  Future<Either<Failure, List<List<Media>>>> call(NoParameters p) async {
    return await _baseTvShowsRepository.getTVShows();
  }

}