import 'package:go_router/go_router.dart';
import 'package:movie_app/core/presentation/pages/main_page.dart';
import 'package:movie_app/movies/presentation/views/movies_view.dart';
import 'package:movie_app/core/resources/app_routes.dart';
import 'package:movie_app/search/presentation/views/search_view.dart';
import 'package:movie_app/tvshows/presentation/views/tv_shows_view.dart';
import 'package:movie_app/watchlist/presentation/view/watchlist_view.dart';

const String moviesPath = '/movies';
const String movieDetailsPath = 'movieDetails/:movieId';
const String popularMoviesPath = 'popularMovies';
const String topRatedMoviesPath = 'topRatedMovies';
const String tvShowsPath = '/tvShows';
const String tvShowDetailsPath = 'tvShowDetails/:tvShowId';
const String popularTVShowsPath = 'popularTVShows';
const String topRatedTVShowsPath = 'topRatedTVShows';
const String searchPath = '/search';
const String watchlistPath = '/watchlist';

class AppRouter {
  GoRouter router = GoRouter(initialLocation: moviesPath, routes: [
    ShellRoute(
        builder: (context, state, child) => MainPage(child: child),
        routes: [
          GoRoute(
            name: AppRoutes.moviesRoute,
            path: moviesPath,
            pageBuilder: (context, state) =>
                const NoTransitionPage(child: MoviesView()),
          ),
          GoRoute(
            name: AppRoutes.tvShowsRoute,
            path: tvShowsPath,
            pageBuilder: (context, state) =>
                const NoTransitionPage(child: TVShowsView()),
          ),
          GoRoute(
            name: AppRoutes.searchRoute,
            path: searchPath,
            pageBuilder: (context, state) => const NoTransitionPage(
              child: SearchView(),
            ),
          ),
          GoRoute(
            name: AppRoutes.watchlistRoute,
            path: watchlistPath,
            pageBuilder: (context, state) => const NoTransitionPage(
              child: WatchListView(),
            ),
          ),
        ])
  ]);
}
