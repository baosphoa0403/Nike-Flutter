class Product {
  final int id;
  final String name;
  final String desc;
  final int price;
  Product(this.id, this.name, this.desc, this.price);

  @override
  String toString() {
    return 'Product(id: $id, name: $name, desc: $desc, price: $price)';
  }
}

class CartProduct {
  Product product;
  int quantity;
  CartProduct({required this.product, required this.quantity});

  @override
  String toString() =>
      'CartProduct(product: $product.toString(), quantity: $quantity)';
}
