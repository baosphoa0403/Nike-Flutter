import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'user_signup_request.g.dart';

@JsonSerializable(
    checked: true,
    disallowUnrecognizedKeys: true,
    fieldRename: FieldRename.snake)
class UserSignUpRequest {
  final String username;
  final String email;
  final String password;
  final String name;
  final int yearOfBirth;
  final String address;

  UserSignUpRequest(
      {required this.username,
      required this.email,
      required this.password,
      required this.name,
      required this.yearOfBirth,
      required this.address});

  factory UserSignUpRequest.fromJson(Map<String, dynamic> json) =>
      _$UserSignUpRequestFromJson(json);

  Map<String, dynamic> toJson() => _$UserSignUpRequestToJson(this);

  // Map<String, dynamic> toMap() {
  //   return {
  //     'email': email,
  //     'password': password,
  //     'username': username,
  //     'name': name,
  //     'yearOfBirth': yearOfBirth,
  //     'address': address,
  //   };
  // }

  // factory UserSignUpRequest.fromMap(Map<String, dynamic> map) {
  //   return UserSignUpRequest(
  //     email: map['email'],
  //     password: map['password'],
  //     username: map['username'],
  //     name: map['name'],
  //     yearOfBirth: map['yearOfBirth'],
  //     address: map['address'],
  //   );
  // }

  // String toJson() => json.encode(toMap());

  // factory UserSignUpRequest.fromJson(String source) => UserSignUpRequest.fromMap(json.decode(source));
}
