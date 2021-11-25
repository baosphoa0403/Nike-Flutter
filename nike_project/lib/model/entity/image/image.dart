class Image {
  Image({
    required this.id,
    required this.urlImage,
    required this.idShoesDetail,
  });

  String id;
  String urlImage;
  String idShoesDetail;

  factory Image.fromJson(Map<String, dynamic> json) => Image(
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
