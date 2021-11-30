class Product {
  Product({
    required this.id,
    required this.name,
    required this.category,
    required this.createDate,
  });

  String id;
  String name;
  String category;
  DateTime createDate;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["_id"],
        name: json["name"],
        category: json["category"],
        createDate: DateTime.parse(json["createDate"]),
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "category": category,
        "createDate": createDate.toIso8601String(),
      };
}
