class KategoriModel {
  final int id;
  final String namaKategori;
  final int? createdBy;
  final DateTime? createdAt;

  KategoriModel(
      {required this.id,
      required this.namaKategori,
      this.createdBy,
      this.createdAt});

  factory KategoriModel.fromJson(Map<String, dynamic> json) {
    return KategoriModel(
        id: json["id"],
        namaKategori: json["nama_kategori"],
        createdBy: (json["created_by"] == null ? null : 1),
        createdAt: (json["created_at"] == null
            ? null
            : DateTime.parse(json["createdAt"])));
  }

  static List<KategoriModel> fromJsonList(List list) {
    return list.map((item) => KategoriModel.fromJson(item)).toList();
  }

  ///this method will prevent the override of toString
  String dataAsString() {
    return '#${this.id} ${this.namaKategori}';
  }

  ///this method will prevent the override of toString
  // bool userFilterByCreationDate(String filter) {
  //   return this?.createdAt?.toString()?.contains(filter);
  // }

  ///custom comparing function to check if two users are equal
  bool isEqual(KategoriModel model) {
    return this.id == model.id;
  }

  @override
  String toString() => namaKategori;

}

