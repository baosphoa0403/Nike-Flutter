import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

//part 'status.g.dart';

// @JsonSerializable(
//     checked: true,
//     disallowUnrecognizedKeys: true,
//     fieldRename: FieldRename.snake)
class StatusDetail {
  final String id;
  final String nameStatus;

  StatusDetail({required this.id, required this.nameStatus});

  // factory StatusDetail.fromJson(Map<String,dynamic> json)=> _$StatusFromJson(json);
  // Map<String,dynamic> toJson() => _$StatusToJson(this);

  Map<String, dynamic> toMap() {
    return {
      '_id': id,
      'nameStatus': nameStatus,
    };
  }

  factory StatusDetail.fromMap(Map<String, dynamic> map) {
    return StatusDetail(
      id: map['_id'],
      nameStatus: map['nameStatus'],
    );
  }

  String toJson() => json.encode(toMap());

  factory StatusDetail.fromJson(String source) =>
      StatusDetail.fromMap(json.decode(source));
}
