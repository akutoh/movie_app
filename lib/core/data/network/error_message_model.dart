// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

class ErrorMessageModel extends Equatable {

  final int statusCode;
  final String statusMessage;
  final bool success;
  const ErrorMessageModel({
    required this.statusCode,
    required this.statusMessage,
    required this.success,
  });

  @override
  List<Object> get props => [statusCode, statusMessage, success];


  ErrorMessageModel copyWith({
    int? statusCode,
    String? statusMessage,
    bool? success,
  }) {
    return ErrorMessageModel(
      statusCode: statusCode ?? this.statusCode,
      statusMessage: statusMessage ?? this.statusMessage,
      success: success ?? this.success,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'statusCode': statusCode,
      'statusMessage': statusMessage,
      'success': success,
    };
  }

  factory ErrorMessageModel.fromMap(Map<String, dynamic> map) {
    return ErrorMessageModel(
      statusCode: map['statusCode'] as int,
      statusMessage: map['statusMessage'] as String,
      success: map['success'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory ErrorMessageModel.fromJson(String source) => ErrorMessageModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;
}
