
import 'package:go_router/go_router.dart';
import 'package:movie_app/core/presentation/pages/main_page.dart';
import 'package:movie_app/movies/presentation/views/movies_view.dart';
import 'package:movie_app/resources/app_routes.dart';

const String moviesPath = '/movies';

class AppRouter {
  GoRouter router = GoRouter(
    initialLocation: moviesPath,
    routes: [
      ShellRoute(
        builder: (context, state, child) => MainPage(child: child),
        routes: [
          GoRoute(
            name: AppRoutes.moviesRoute,
            path: moviesPath,
            pageBuilder: (context, state) => const NoTransitionPage(child: MoviesView()),),
      ])
  ]);
}