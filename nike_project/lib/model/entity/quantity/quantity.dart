import 'package:nike_project/model/entity/size/size.dart';

class Quantity {
  Quantity({
    required this.id,
    required this.quantity,
    required this.size,
    required this.price,
    required this.productDetail,
  });

  String id;
  int quantity;
  Size size;
  int price;
  String productDetail;

  factory Quantity.fromJson(Map<String, dynamic> json) => Quantity(
        id: json["_id"],
        quantity: json["quantity"],
        size: Size.fromJson(json["size"]),
        price: json["price"],
        productDetail: json["productDetail"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "quantity": quantity,
        "size": size.toJson(),
        "price": price,
        "productDetail": productDetail,
      };
}
