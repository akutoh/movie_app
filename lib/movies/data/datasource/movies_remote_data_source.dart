import 'package:movie_app/core/data/error/exceptions.dart';
import 'package:movie_app/core/data/network/api_constants.dart';
import 'package:movie_app/core/data/network/error_message_model.dart';
import 'package:movie_app/movies/data/models/movie_model.dart';
import 'package:dio/dio.dart';

abstract class MoviesRemoteDataSource {
  Future<List<List<MovieModel>>> getMovies();
  Future<List<MovieModel>> getNowPlayingMovies();
  Future<List<MovieModel>> getPopularMovies();
  Future<List<MovieModel>> getTopRatedMovies();
}

class MoviesRemoteDataSourceImpl extends MoviesRemoteDataSource {
  @override
  Future<List<List<MovieModel>>> getMovies() async {
    final response = Future.wait(
        [getNowPlayingMovies(), getPopularMovies(), getTopRatedMovies()],
        eagerError: true);
    return response;
  }

  @override
  Future<List<MovieModel>> getNowPlayingMovies() async {
    final response = await Dio().get(ApiConstants.nowPlayingMoviesPath);
    if (response.statusCode == 200) {
      return List<MovieModel>.from(
        (response.data['results'] as List).map(
          (e) => MovieModel.fromJson(e),
        ),
      );
    } else {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }

  @override
  Future<List<MovieModel>> getPopularMovies() async {
    final response = await Dio().get(ApiConstants.popularMoviesPath);
    if (response.statusCode == 200) {
      return List<MovieModel>.from(
        (response.data['results'] as List).map(
          (e) => MovieModel.fromJson(e),
        ),
      );
    } else {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }

  @override
  Future<List<MovieModel>> getTopRatedMovies() async {
    final response = await Dio().get(ApiConstants.topRatedMoviesPath);
    if (response.statusCode == 200) {
      return List<MovieModel>.from(
        (response.data['results'] as List).map(
          (e) => MovieModel.fromJson(e),
        ),
      );
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }
}
