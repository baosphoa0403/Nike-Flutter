import 'dart:convert';

class Product {
  int id;
  String name;
  double price;
  String description;
  Product({
    required this.id,
    required this.name,
    required this.price,
    required this.description,
  });

  @override
  String toString() {
    return 'Product(id: $id, name: $name, price: $price, description: $description)';
  }

  Product copyWith({
    int? id,
    String? name,
    double? price,
    String? description,
  }) {
    return Product(
      id: id ?? this.id,
      name: name ?? this.name,
      price: price ?? this.price,
      description: description ?? this.description,
    );
  }

  
}
