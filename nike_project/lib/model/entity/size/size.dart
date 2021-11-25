class Size {
  Size({
    required this.id,
    required this.nameSize,
  });

  String id;
  String nameSize;

  factory Size.fromJson(Map<String, dynamic> json) => Size(
        id: json["_id"],
        nameSize: json["nameSize"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "nameSize": nameSize,
      };
}
