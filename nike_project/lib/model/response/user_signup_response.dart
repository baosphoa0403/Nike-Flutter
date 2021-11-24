
import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';
import 'package:nike_project/model/entity/role/role.dart';
import 'package:nike_project/model/entity/status/status.dart';

//part 'user_signup_response.g.dart';

@JsonSerializable(checked: true, 
disallowUnrecognizedKeys: true, 
fieldRename: FieldRename.snake)
class UserSignUpResponse {
  final String id;
  final String username;
  final String email;
  final String name;
  final int yearOfBirth;
  final String address;
  final Status status;
  final Role role;
  final int v; 

  UserSignUpResponse({required this.id,
  required this.username,
  required this.email,
  required this.name,
  required this.yearOfBirth,
  required this.address,
  required this.status,
  required this.role,
  required this.v
   });

  // factory UserSignUpResponse.fromJson(Map<String,dynamic> json)=> _$UserSignUpResponseFromJson(json);
  // Map<String,dynamic> toJson() => _$UserSignUpResponseToJson(this);

  Map<String, dynamic> toMap() {
    return {
      '_id': id,
      'username': username,
      'email': email,
      'name': name,
      'yearOfBirth': yearOfBirth,
      'address': address,
      'status': status.toMap(),
      'role': role.toMap(),
      '__v': v,
    };
  }

  factory UserSignUpResponse.fromMap(Map<String, dynamic> map) {
    return UserSignUpResponse(
      id: map['_id'],
      username: map['username'],
      email: map['email'],
      name: map['name'],
      yearOfBirth: map['yearOfBirth'],
      address: map['address'],
      status: Status.fromMap(map['status']),
      role: Role.fromMap(map['role']),
      v: map['__v'],
    );
  }

  String toJson() => json.encode(toMap());

  factory UserSignUpResponse.fromJson(String source) => UserSignUpResponse.fromMap(json.decode(source));
}
