class ApiConstants {
  static const String apiKey = 'ae43358cd62c645d16ae190ed56d39cd';
  static const String baseUrl = 'https://api.themoviedb.org/3';

  static const String baseBackdropUrl = 'https://image.tmdb.org/t/p/w1280';
  static const String basePosterUrl = 'https://image.tmdb.org/t/p/w500';

  static const String moviePlaceHolder =
      'https://davidkoepp.com/wp-content/themes/blankslate/images/Movie%20Placeholder.jpg';


  // movies paths
  static const String nowPlayingMoviesPath =
      '$baseUrl/movie/now_playing?api_key=$apiKey';

  static const String popularMoviesPath =
      '$baseUrl/movie/popular?api_key=$apiKey';

  static const String topRatedMoviesPath =
      '$baseUrl/movie/top_rated?api_key=$apiKey';

  // tv shows paths
  static const String onAirTvShowsPath =
      '$baseUrl/tv/on_the_air?api_key=$apiKey&with_original_language=en';

  static const String popularTvShowsPath =
      '$baseUrl/tv/popular?api_key=$apiKey&with_original_language=en';

  static const String topRatedTvShowsPath =
      '$baseUrl/tv/top_rated?api_key=$apiKey&with_original_language=en';
}