import 'package:nike_project/model/entity/color_product/color.dart';
import 'package:nike_project/model/entity/gender/gender.dart';

class InfoProduct {
  InfoProduct({
    required this.id,
    required this.product,
    required this.status,
    required this.color,
    required this.gender,
  });

  String id;
  String product;
  String status;
  Color color;
  Gender gender;

  factory InfoProduct.fromJson(Map<String, dynamic> json) => InfoProduct(
        id: json["_id"],
        product: json["product"],
        status: json["status"],
        color: Color.fromJson(json["color"]),
        gender: Gender.fromJson(json["gender"]),
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "product": product,
        "status": status,
        "color": color.toJson(),
        "gender": gender.toJson(),
      };
}
