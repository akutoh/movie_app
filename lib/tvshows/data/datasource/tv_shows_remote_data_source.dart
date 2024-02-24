import 'package:dio/dio.dart';
import 'package:movie_app/core/data/error/exceptions.dart';
import 'package:movie_app/core/data/network/api_constants.dart';
import 'package:movie_app/core/data/network/error_message_model.dart';
import 'package:movie_app/tvshows/data/models/tv_shows_model.dart';

abstract class TvShowsRemoteDataSource {
  Future<List<List<TvShowsModel>>> getTVShows();
  Future<List<TvShowsModel>> getOnAirTvShows();
  Future<List<TvShowsModel>> getPopularTvShows();
  Future<List<TvShowsModel>> getTopRatedTvShows();
}

class TvShowsRemoteDataSourceImpl extends TvShowsRemoteDataSource {
  @override
  Future<List<List<TvShowsModel>>> getTVShows() {
    final response = Future.wait(
        [getOnAirTvShows(), getPopularTvShows(), getTopRatedTvShows()],
        eagerError: true);
    return response;
  }

  @override
  Future<List<TvShowsModel>> getOnAirTvShows() async {
    final response = await Dio().get(ApiConstants.onAirTvShowsPath);
    if (response.statusCode == 200) {
      return List<TvShowsModel>.from((response.data['results'] as List)
          .map((e) => TvShowsModel.fromJson(e)));
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<List<TvShowsModel>> getPopularTvShows() async {
    final response = await Dio().get(ApiConstants.popularTvShowsPath);
    if (response.statusCode == 200) {
      return List<TvShowsModel>.from((response.data['results'] as List)
          .map((e) => TvShowsModel.fromJson(e)));
    } else {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }

  @override
  Future<List<TvShowsModel>> getTopRatedTvShows() async {
    final response = await Dio().get(ApiConstants.topRatedTvShowsPath);
    if (response.statusCode == 200) {
      return List<TvShowsModel>.from((response.data['results'] as List)
          .map((e) => TvShowsModel.fromJson(e)));
    } else {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }
}
