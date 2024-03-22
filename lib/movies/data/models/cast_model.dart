import 'package:movie_app/core/utils/functions.dart';
import 'package:movie_app/movies/data/domain/entities/cast.dart';

class CastModel extends Cast {
  const CastModel(
      {required super.name, required super.profileUrl, required super.gender});

  factory CastModel.fromJson(Map<String, dynamic> json) {
    return CastModel(
        name: json['name'],
        profileUrl: getProfileImageUrl(json),
        gender: json['gender']);
  }
}