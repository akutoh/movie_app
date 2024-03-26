import 'package:get_it/get_it.dart';
import 'package:movie_app/movies/data/datasource/movies_remote_data_source.dart';
import 'package:movie_app/movies/data/domain/repository/movies_repository.dart';
import 'package:movie_app/movies/data/domain/usecases/get_movie_details_usecase.dart';
import 'package:movie_app/movies/data/domain/usecases/get_movies_usecase.dart';
import 'package:movie_app/movies/presentation/controllers/movie_details_bloc/movie_details_bloc.dart';
import 'package:movie_app/movies/presentation/controllers/movies_bloc/movies_bloc.dart';
import 'package:movie_app/movies/repository/movies_repository_impl.dart';
import 'package:movie_app/search/data/datasource/search_remote_data_source.dart';
import 'package:movie_app/search/data/repository/search_repository_impl.dart';
import 'package:movie_app/search/domain/repository/search_repository.dart';
import 'package:movie_app/search/domain/usecases/search_usecase.dart';
import 'package:movie_app/search/presentation/controllers/search_bloc/search_bloc.dart';
import 'package:movie_app/tvshows/data/datasource/tv_shows_remote_data_source.dart';
import 'package:movie_app/tvshows/data/repository/tv_shows_repository_impl.dart';
import 'package:movie_app/tvshows/domain/repository/tv_shows_repository.dart';
import 'package:movie_app/tvshows/domain/usecase/get_tv_shows_use_case.dart';
import 'package:movie_app/tvshows/presentation/controllers/tv_shows_bloc/tv_shows_bloc.dart';
import 'package:movie_app/watchlist/data/datasource/watchlist_local_data_source.dart';
import 'package:movie_app/watchlist/data/repository/watchlist_repository_impl.dart';
import 'package:movie_app/watchlist/domain/repository/watchlist_repository.dart';
import 'package:movie_app/watchlist/domain/usecases/add_watchlist_item_usecase.dart';
import 'package:movie_app/watchlist/domain/usecases/check_if_item_added_usecase.dart';
import 'package:movie_app/watchlist/domain/usecases/get_watchlist_items_usecase.dart';
import 'package:movie_app/watchlist/domain/usecases/remove_watchlist_item_usecase.dart';
import 'package:movie_app/watchlist/presentation/controllers/watchlist_bloc/watchlist_bloc.dart';

final sl = GetIt.instance;

class ServiceLocator {
  static void init() {
    // data source
    sl.registerLazySingleton<MoviesRemoteDataSource>(() => MoviesRemoteDataSourceImpl());
    sl.registerLazySingleton<TvShowsRemoteDataSource>(() => TvShowsRemoteDataSourceImpl());
    sl.registerLazySingleton<WatchlistLocalDataSource>(() => WatchlistLocalDataSourceImpl());
    sl.registerLazySingleton<SearchRemoteDataSource>(() => SearchRemoteDataSourceImpl());

    // repository
    sl.registerLazySingleton<MoviesRepository>(() => MoviesRepositoryImpl(sl()));
    sl.registerLazySingleton<TvShowsRepository>(() => TvShowsRepositoryImpl(sl()));
    sl.registerLazySingleton<WatchlistRepository>(() => WatchListRepositoryImpl(sl()));
    sl.registerLazySingleton<SearchRepository>(() => SearchRepositoryImpl(sl()));

    // use cases
    sl.registerLazySingleton(() => GetMoviesUseCase(sl()));
    sl.registerLazySingleton(() => GetTvShowsUseCase(sl()));
    sl.registerLazySingleton(() => GetWatchlistItemsUseCase(sl()));
    sl.registerLazySingleton(() => GetMovieDetailsUseCase(sl()));
    sl.registerLazySingleton(() => AddWatchlistItemUseCase(sl()));
    sl.registerLazySingleton(() => RemoveWatchlistItemsUseCase(sl()));
    sl.registerLazySingleton(() => CheckIfItemAddedUseCase(sl()));
    sl.registerLazySingleton(() => SearchUseCase(sl()));

    // bloc
    sl.registerFactory(() => MoviesBloc(sl()));
    sl.registerFactory(() => TvShowsBloc(sl()));
    sl.registerFactory(() => WatchlistBloc(sl(), sl(), sl(), sl()));
    sl.registerFactory(() => MovieDetailsBloc(sl()));
    sl.registerFactory(() => SearchBloc(sl()));
  }
}