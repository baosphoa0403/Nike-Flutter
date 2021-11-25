import 'package:nike_project/model/entity/image/image.dart';
import 'package:nike_project/model/entity/info_product/info_prodcut.dart';
import 'package:nike_project/model/entity/quantity/quantity.dart';

class DetailProduct {
  DetailProduct({
    required this.info,
    required this.quantities,
    required this.images,
  });

  InfoProduct info;
  List<Quantity> quantities;
  List<Image> images;

  factory DetailProduct.fromJson(Map<String, dynamic> json) => DetailProduct(
        info: InfoProduct.fromJson(json["info"]),
        quantities: List<Quantity>.from(
            json["quantities"].map((x) => Quantity.fromJson(x))),
        images: List<Image>.from(json["images"].map((x) => Image.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "info": info.toJson(),
        "quantities": List<dynamic>.from(quantities.map((x) => x.toJson())),
        "images": List<dynamic>.from(images.map((x) => x.toJson())),
      };
}
