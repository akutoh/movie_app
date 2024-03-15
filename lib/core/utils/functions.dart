import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_app/core/data/network/api_constants.dart';
import 'package:movie_app/core/domain/entities/media.dart';
import 'package:movie_app/core/resources/app_routes.dart';

String getDate(String? date) {
  if (date == null || date.isEmpty) {
    return '';
  }

  final vals = date.split('-');
  String year = vals[0];
  int monthNumber = int.parse(vals[1]);
  String day = vals[2];

  String month = '';

  switch (monthNumber) {
    case 1:
      month = 'Jan';
      break;
    case 2:
      month = 'Feb';
      break;
    case 3:
      month = 'Mar';
      break;
    case 4:
      month = 'Apr';
      break;
    case 5:
      month = 'May';
      break;
    case 6:
      month = 'Jun';
      break;
    case 7:
      month = 'Jul';
      break;
    case 8:
      month = 'Aug';
      break;
    case 9:
      month = 'Sep';
      break;
    case 10:
      month = 'Oct';
      break;
    case 11:
      month = 'Nov';
      break;
    case 12:
      month = 'Dec';
      break;
    default:
      break;
  }
  return '$month $day, $year';
}

String getPosterUrl(String? path) {
  if (path != null) {
    return ApiConstants.basePosterUrl + path;
  } else {
    return ApiConstants.moviePlaceHolder;
  }
}

String getBackdropUrl(String? path) {
  if (path != null) {
    return ApiConstants.baseBackdropUrl + path;
  } else {
    return ApiConstants.moviePlaceHolder;
  }
}

String getGenres(List<dynamic> genres) {
  if (genres.isNotEmpty) {
    return genres.first['name'];
  } else {
    return '';
  }
}

String getLength(int? runtime) {
  if (runtime == null || runtime == 0) {
    return '';
  }
  if (runtime < 60) {
    return '${runtime}m';
  }
  if (runtime % 60 == 0) {
    return '${runtime ~/ 60}h';
  }
  return '${runtime ~/ 60}h ${runtime % 60}m';
}

String getVotesCount(int voteCount) {
  if (voteCount < 1000) {
    return '($voteCount)';
  }
  return '(${voteCount ~/ 1000}k)';
}

String getTrailerUrl(Map<String, dynamic> json) {
  List videos = json['videos']['results'];
  if (videos.isNotEmpty) {
    List trailers = videos.where((e) => e['type'] == 'Trailer').toList();
    if (trailers.isNotEmpty) {
      return ApiConstants.baseVideoUrl + trailers.last['key'];
    } else {
      return '';
    }
  } else {
    return '';
  }
}

String getProfileImageUrl(Map<String, dynamic> json) {
  if (json['profile_path'] != null) {
    return ApiConstants.baseProfileUrl + json['profile_path'];
  } else {
    return ApiConstants.castPlaceHolder;
  }
}

String getAvatarUrl(String? path) {
  if (path != null) {
    if (path.startsWith('/https://www.gravatar.com/avatar')) {
      return path.substring(1);
    } else {
      return ApiConstants.baseAvatarUrl + path;
    }
  } else {
    return ApiConstants.avatarPlaceHolder;
  }
}

String getElapsedTime(String date) {
  DateTime reviewDate = DateTime.parse(date);
  DateTime today = DateTime.now();

  Duration diff = today.difference(reviewDate);
  if (diff.inDays >= 365) {
    int years = diff.inDays ~/ 365;
    return '${years}y';
  } else if (diff.inDays >= 30) {
    int months = diff.inDays ~/ 30;
    return '${months}mo';
  } else if (diff.inDays >= 7) {
    int weeks = diff.inDays ~/ 7;
    return '${weeks}w';
  } else if (diff.inDays >= 1) {
    return '${diff.inDays}d';
  } else if (diff.inHours >= 1) {
    int hours = diff.inHours ~/ 24;
    return '${hours}h';
  } else if (diff.inMinutes >= 1) {
    int minutes = diff.inDays ~/ 60;
    return '${minutes}min';
  } else {
    return 'Now';
  }
}

// navigation
void navigateToDetailsView(BuildContext context, Media media) {
  if (media.isMovie) {
    context.pushNamed(
      AppRoutes.movieDetailsRoute,
      pathParameters: {
        'movieId': media.tmdbID.toString(),
      },
    );
  } else {
    context.pushNamed(
      AppRoutes.tvShowDetailsRoute,
      pathParameters: {
        'tvShowId': media.tmdbID.toString(),
      },
    );
  }
}
