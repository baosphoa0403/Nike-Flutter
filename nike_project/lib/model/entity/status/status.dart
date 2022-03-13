
import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

//part 'status.g.dart';

@JsonSerializable(checked: true, 
disallowUnrecognizedKeys: true, 
fieldRename: FieldRename.snake)
class Status {
  final String id;
  final String nameStatus;
  final int v;

  Status({required this.id,required this.nameStatus,required this.v});
  
  // factory Status.fromJson(Map<String,dynamic> json)=> _$StatusFromJson(json);
  // Map<String,dynamic> toJson() => _$StatusToJson(this);

  Map<String, dynamic> toMap() {
    return {
      '_id': id,
      'nameStatus': nameStatus,
      '__v': v,
    };
  }

  factory Status.fromMap(Map<String, dynamic> map) {
    return Status(
      id: map['_id'],
      nameStatus: map['nameStatus'],
      v: map['__v'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Status.fromJson(String source) => Status.fromMap(json.decode(source));
}
