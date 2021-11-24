import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

//part 'role.g.dart';

@JsonSerializable(checked: true, 
disallowUnrecognizedKeys: true, 
fieldRename: FieldRename.snake)
class Role {
  final String id;
  final List listUser;
  final String nameRole;
  final int v;

  Role({required this.id,required this.listUser,required this.nameRole,required this.v});

  // factory Role.fromJson(Map<String,dynamic> json)=> _$RoleFromJson(json);
  // Map<String,dynamic> toJson() => _$RoleToJson(this);

  Map<String, dynamic> toMap() {
    return {
      '_id': id,
      'listUser': listUser,
      'nameRole': nameRole,
      '__v': v,
    };
  }

  factory Role.fromMap(Map<String, dynamic> map) {
    return Role(
      id: map['_id'],
      listUser: List.from(map['listUser']),
      nameRole: map['nameRole'],
      v: map['__v'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Role.fromJson(String source) => Role.fromMap(json.decode(source));
}
