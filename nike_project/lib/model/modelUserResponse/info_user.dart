import 'dart:convert';

import 'package:nike_project/model/modelUserResponse/info.dart';

class UserInfor {
  final int statusCode;
  final Info info;
  final String accessToken;
  final String message;
  UserInfor(
    this.statusCode,
    this.info,
    this.accessToken,
    this.message,
  );

  UserInfor copyWith({
    int? statusCode,
    Info? info,
    String? accessToken,
    String? message,
  }) {
    return UserInfor(
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
      'access_token': accessToken,
      'message': message,
    };
  }

  factory UserInfor.fromMap(Map<String, dynamic> map) {
    return UserInfor(
      map['statusCode'],
      Info.fromMap(map['info']),
      map['access_token'],
      map['message'],
    );
  }

  String toJson() => json.encode(toMap());

  factory UserInfor.fromJson(String source) =>
      UserInfor.fromMap(json.decode(source));

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is UserInfor &&
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
    return 'UserInfor(statusCode: $statusCode, info: $info, access_token: $accessToken, message: $message)';
  }
}
