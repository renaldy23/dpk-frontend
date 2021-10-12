class KategoriBeratModel {
  final int id;
  final String kodeKategoriBerat;
  final String namaKategoriBerat;
  final int? createdBy;
  final DateTime? createdAt;

  KategoriBeratModel(
      {required this.id,
      required this.kodeKategoriBerat,
      required this.namaKategoriBerat,
      this.createdBy,
      this.createdAt});

  factory KategoriBeratModel.fromJson(Map<String, dynamic> json) {
    return KategoriBeratModel(
        id: json["id"],
        kodeKategoriBerat: json["kode_kategori_berat"],
        namaKategoriBerat: json["nama_kategori_berat"],
        createdBy: (json["created_by"] == null ? null : 1),
        createdAt: (json["created_at"] == null
            ? null
            : DateTime.parse(json["createdAt"])));
  }

  static List<KategoriBeratModel> fromJsonList(List list) {
    return list.map((item) => KategoriBeratModel.fromJson(item)).toList();
  }

  ///this method will prevent the override of toString
  String dataAsString() {
    return '#${this.id} ${this.namaKategoriBerat}';
  }

  ///custom comparing function to check if two users are equal
  bool isEqual(KategoriBeratModel model) {
    return this.id == model.id;
  }

  @override
  String toString() => namaKategoriBerat;

}

