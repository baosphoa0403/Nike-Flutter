class Gender {
  Gender({
    required this.id,
    required this.nameGender,
  });

  String id;
  String nameGender;

  factory Gender.fromJson(Map<String, dynamic> json) => Gender(
        id: json["_id"],
        nameGender: json["nameGender"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "nameGender": nameGender,
      };
}
