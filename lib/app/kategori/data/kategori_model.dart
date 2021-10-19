class KategoriModel {
  int? id;
  String? namaKategori;
  int? createdById;
  String? createdAt;

  KategoriModel({this.id, this.namaKategori, this.createdById, this.createdAt});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.id;
    data['nama_kategori'] = this.namaKategori;
    data['created_by_id'] = this.createdById;
    data['created_at'] = this.createdAt;

    return data;
  }

  factory KategoriModel.fromJson(Map<String, dynamic> json) {
    return KategoriModel(
      id: json["id"],
      namaKategori: json["nama_kategori"],
      createdById: json["created_by_id"],
      createdAt: json["created_at"],
    );
  }

  static List<KategoriModel> fromJsonList(List list) {
    return list.map((item) => KategoriModel.fromJson(item)).toList();
  }

  // this method will prevent the override of toString
  String dataAsString() {
    return '#${this.id} ${this.namaKategori}';
  }

  // custom comparing function to check if two users are equal
  bool isEqual(KategoriModel model) {
    return this.id == model.id;
  }

  @override
  String toString() => namaKategori!;
}
