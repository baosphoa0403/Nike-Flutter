class Color {
  Color({
    required this.id,
    required this.nameColor,
  });

  String id;
  String nameColor;

  factory Color.fromJson(Map<String, dynamic> json) => Color(
        id: json["_id"],
        nameColor: json["nameColor"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "nameColor": nameColor,
      };
}
