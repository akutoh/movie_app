import 'package:get_it/get_it.dart';
import 'package:movie_app/movies/data/datasource/movies_remote_data_source.dart';
import 'package:movie_app/movies/data/domain/repository/movies_repository.dart';
import 'package:movie_app/movies/data/domain/usecases/get_movies_usecase.dart';
import 'package:movie_app/movies/presentation/controllers/movies_bloc/movies_bloc.dart';
import 'package:movie_app/movies/repository/movies_repository_impl.dart';

final sl = GetIt.instance;

class ServiceLocator {
  static void init() {
    // data source
    sl.registerLazySingleton<MoviesRemoteDataSource>(() => MoviesRemoteDataSourceImpl());

    // repository
    sl.registerLazySingleton<MoviesRepository>(() => MoviesRepositoryImpl(sl()));

    // use cases
    sl.registerLazySingleton(() => GetMoviesUseCase(sl()));

    // bloc
    sl.registerFactory(() => MoviesBloc(sl()));
  }
}