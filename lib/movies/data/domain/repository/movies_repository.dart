import 'package:dartz/dartz.dart';
import 'package:movie_app/core/data/error/failure.dart';
import 'package:movie_app/core/domain/entities/media.dart';

abstract class MoviesRepository {
  Future<Either<Failure, List<List<Media>>>> getMovies();
}