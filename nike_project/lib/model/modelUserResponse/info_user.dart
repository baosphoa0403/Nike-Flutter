import 'dart:convert';

import 'package:nike_project/model/modelUserResponse/info.dart';

class InfoUser {
  final String statusCode;
  final Info info;
  final String accessToken;
  final String message;
  InfoUser(
    this.statusCode,
    this.info,
    this.accessToken,
    this.message,
  );

  InfoUser copyWith({
    String? statusCode,
    Info? info,
    String? accessToken,
    String? message,
  }) {
    return InfoUser(
      statusCode ?? this.statusCode,
      info ?? this.info,
      accessToken ?? this.accessToken,
      message ?? this.message,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'statusCode': statusCode,
      'info': info.toMap(),
      'accessToken': accessToken,
      'message': message,
    };
  }

  factory InfoUser.fromMap(Map<String, dynamic> map) {
    return InfoUser(
      map['statusCode'],
      Info.fromMap(map['info']),
      map['accessToken'],
      map['message'],
    );
  }

  String toJson() => json.encode(toMap());

  factory InfoUser.fromJson(String source) =>
      InfoUser.fromMap(json.decode(source));

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is InfoUser &&
        other.statusCode == statusCode &&
        other.info == info &&
        other.accessToken == accessToken &&
        other.message == message;
  }

  @override
  int get hashCode {
    return statusCode.hashCode ^
        info.hashCode ^
        accessToken.hashCode ^
        message.hashCode;
  }

  @override
  String toString() {
    return 'InfoUser(statusCode: $statusCode, info: $info, accessToken: $accessToken, message: $message)';
  }
}
