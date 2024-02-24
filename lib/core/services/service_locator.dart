import 'package:get_it/get_it.dart';
import 'package:movie_app/movies/data/datasource/movies_remote_data_source.dart';
import 'package:movie_app/movies/data/domain/repository/movies_repository.dart';
import 'package:movie_app/movies/data/domain/usecases/get_movies_usecase.dart';
import 'package:movie_app/movies/presentation/controllers/movies_bloc/movies_bloc.dart';
import 'package:movie_app/movies/repository/movies_repository_impl.dart';
import 'package:movie_app/tvshows/data/datasource/tv_shows_remote_data_source.dart';
import 'package:movie_app/tvshows/data/repository/tv_shows_repository_impl.dart';
import 'package:movie_app/tvshows/domain/repository/tv_shows_repository.dart';
import 'package:movie_app/tvshows/domain/usecase/get_tv_shows_use_case.dart';
import 'package:movie_app/tvshows/presentation/controllers/tv_shows_bloc/tv_shows_bloc.dart';

final sl = GetIt.instance;

class ServiceLocator {
  static void init() {
    // data source
    sl.registerLazySingleton<MoviesRemoteDataSource>(() => MoviesRemoteDataSourceImpl());
    sl.registerLazySingleton<TvShowsRemoteDataSource>(() => TvShowsRemoteDataSourceImpl());

    // repository
    sl.registerLazySingleton<MoviesRepository>(() => MoviesRepositoryImpl(sl()));
    sl.registerLazySingleton<TvShowsRepository>(() => TvShowsRepositoryImpl(sl()));

    // use cases
    sl.registerLazySingleton(() => GetMoviesUseCase(sl()));
    sl.registerLazySingleton(() => GetTvShowsUseCase(sl()));

    // bloc
    sl.registerFactory(() => MoviesBloc(sl()));
    sl.registerFactory(() => TvShowsBloc(sl()));
  }
}