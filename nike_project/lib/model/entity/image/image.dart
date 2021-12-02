class ImageProduct {
  ImageProduct({
    required this.id,
    required this.urlImage,
    required this.idShoesDetail,
  });

  String id;
  String urlImage;
  String idShoesDetail;

  factory ImageProduct.fromJson(Map<String, dynamic> json) => ImageProduct(
        id: json["_id"],
        urlImage: json["urlImage"],
        idShoesDetail: json["idShoesDetail"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "urlImage": urlImage,
        "idShoesDetail": idShoesDetail,
      };
}
