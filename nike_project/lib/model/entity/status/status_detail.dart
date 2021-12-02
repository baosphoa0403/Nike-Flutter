class StatusDetail {
  StatusDetail({
    required this.id,
    required this.nameStatus,
  });

  final String id;
  final String nameStatus;

  factory StatusDetail.fromJson(Map<String, dynamic> json) => StatusDetail(
        id: json["_id"],
        nameStatus: json["nameStatus"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "nameStatus": nameStatus,
      };
}
