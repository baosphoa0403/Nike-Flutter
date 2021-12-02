import 'dart:convert';

import 'package:nike_project/model/entity/color_product/color.dart';
import 'package:nike_project/model/entity/gender/gender.dart';
import 'package:nike_project/model/entity/image/image.dart';
import 'package:nike_project/model/entity/product/product.dart';
import 'package:nike_project/model/entity/quantity/quantity.dart';
import 'package:nike_project/model/entity/status/status_detail.dart';

List<ProductDetailResponse> ProductDetailResponseFromJson(String str) =>
    List<ProductDetailResponse>.from(
        json.decode(str).map((x) => ProductDetailResponse.fromJson(x)));

String ProductDetailResponseToJson(List<ProductDetailResponse> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ProductDetailResponse {
  ProductDetailResponse({
    required this.info,
    required this.quantities,
    required this.images,
  });

  Info info;
  List<Quantity> quantities;
  List<ImageProduct> images;

  factory ProductDetailResponse.fromJson(Map<String, dynamic> json) =>
      ProductDetailResponse(
        info: Info.fromJson(json["info"]),
        quantities: List<Quantity>.from(
            json["quantities"].map((x) => Quantity.fromJson(x))),
        images: List<ImageProduct>.from(
            json["images"].map((x) => ImageProduct.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "info": info.toJson(),
        "quantities": List<dynamic>.from(quantities.map((x) => x.toJson())),
        "images": List<dynamic>.from(images.map((x) => x.toJson())),
      };
}

class Info {
  Info({
    required this.id,
    required this.product,
    required this.status,
    required this.color,
    required this.gender,
  });

  String id;
  Product product;
  StatusDetail status;
  Color color;
  Gender gender;

  factory Info.fromJson(Map<String, dynamic> json) => Info(
        id: json["_id"],
        product: Product.fromJson(json["product"]),
        status: StatusDetail.fromJson(json["status"]),
        color: Color.fromJson(json["color"]),
        gender: Gender.fromJson(json["gender"]),
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "product": product.toJson(),
        "status": status.toJson(),
        "color": color.toJson(),
        "gender": gender.toJson(),
      };
}
