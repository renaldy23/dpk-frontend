class SatuanModel {
  final int id;
  final String namaSatuan;
  final int? createdBy;
  final DateTime? createdAt;

  SatuanModel(
      {required this.id,
      required this.namaSatuan,
      this.createdBy,
      this.createdAt});

  factory SatuanModel.fromJson(Map<String, dynamic> json) {
    return SatuanModel(
        id: json["id"],
        namaSatuan: json["nama_satuan"],
        createdBy: (json["created_by"] == null ? null : 1),
        createdAt: (json["created_at"] == null
            ? null
            : DateTime.parse(json["createdAt"])));
  }

  static List<SatuanModel> fromJsonList(List list) {
    return list.map((item) => SatuanModel.fromJson(item)).toList();
  }

  ///this method will prevent the override of toString
  String dataAsString() {
    return '#${this.id} ${this.namaSatuan}';
  }


  ///custom comparing function to check if two users are equal
  bool isEqual(SatuanModel model) {
    return this.id == model.id;
  }

  @override
  String toString() => namaSatuan;

}

