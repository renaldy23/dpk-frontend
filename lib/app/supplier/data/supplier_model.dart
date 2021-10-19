class SupplierModel {
  int? id;
  String? kodeSupplier;
  String? namaSupplier;
  String? telephone;
  String? alamat;
  String? email;
  String? namaSales;
  String? noHandphone;
  String? noRekening;
  String? createdAt;

  SupplierModel({
    this.id,
    this.kodeSupplier,
    this.namaSupplier,
    this.telephone,
    this.alamat,
    this.email,
    this.namaSales,
    this.noHandphone,
    this.noRekening,
    this.createdAt,
  });

  factory SupplierModel.fromJson(Map<String, dynamic> json) {
    return SupplierModel(
        id: json["id"],
        kodeSupplier: json["kode_supplier"],
        namaSupplier: json["nama_supplier"],
        telephone: json["telephone"],
        alamat: json["alamat"],
        email: json["email"],
        namaSales: json["nama_sales"],
        noHandphone: json["no_handphone"],
        noRekening: json["no_rekening"],
        createdAt: json["created_at"]);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["kode_supplier"] = this.kodeSupplier;
    data["nama_supplier"] = this.namaSupplier;
    data["telephone"] = this.telephone;
    data["alamat"] = this.alamat;
    data["email"] = this.email;
    data["nama_sales"] = this.namaSales;
    data["no_handphone"] = this.noHandphone;
    data["no_rekening"] = this.noRekening;
    return data;
  }

  static List<SupplierModel> fromJsonList(List list) {
    return list.map((el) => SupplierModel.fromJson(el)).toList();
  }
}
