import 'package:nike_project/model/product/product.dart';

class Cart {
  Product product;
  int quantity;
  Cart({
    required this.product,
    required this.quantity,
  });

  Cart copyWith({
    Product? product,
    int? quantity,
  }) {
    return Cart(
      product: product ?? this.product,
      quantity: quantity ?? this.quantity,
    );
  }

  @override
  String toString() => 'Cart(product: $product, quantity: $quantity)';
}
