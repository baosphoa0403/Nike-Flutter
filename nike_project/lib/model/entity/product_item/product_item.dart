import 'package:nike_project/model/entity/details_product/details_product.dart';
import 'package:nike_project/model/entity/product/product.dart';

class ProductItem {
  ProductItem({
    required this.product,
    required this.details,
  });

  final Product product;
  final List<DetailProduct> details;

  factory ProductItem.fromJson(Map<String, dynamic> json) => ProductItem(
        product: Product.fromJson(json["product"]),
        details: List<DetailProduct>.from(
            json["details"].map((x) => DetailProduct.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "product": product.toJson(),
        "details": List<dynamic>.from(details.map((x) => x.toJson())),
      };
}
