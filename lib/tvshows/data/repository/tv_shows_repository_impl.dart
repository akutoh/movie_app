import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:movie_app/core/data/error/exceptions.dart';
import 'package:movie_app/core/data/error/failure.dart';
import 'package:movie_app/core/domain/entities/media.dart';
import 'package:movie_app/tvshows/data/datasource/tv_shows_remote_data_source.dart';
import 'package:movie_app/tvshows/domain/repository/tv_shows_repository.dart';

class TvShowsRepositoryImpl extends TvShowsRepository {

  final TvShowsRemoteDataSource _baseTvShowsRemoteDataSource;

  TvShowsRepositoryImpl(this._baseTvShowsRemoteDataSource);

  @override
  Future<Either<Failure, List<List<Media>>>> getTVShows() async {
    try {
      final result = await _baseTvShowsRemoteDataSource.getTVShows();
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    } on DioException catch (failure) {
      return Left(ServerFailure(failure.message!));
    }
  }

}