class ProdukModel {
  int? id;
  String? kodeProduk;
  String? namaProduk;

  int? kategoriId;
  String? namaKategori;

  int? kategoriBeratId;
  String? namaKategoriBerat;

  int? beratProduk;

  String? ukuran;

  bool? isSpecial;

  int? merkId;
  String? namaMerk;

  int? satuanId;
  String? namaSatuan;

  String? keterangan;
  double? hargaJual;
  double? hargaBeli;
  int? jumlahStok;
  int? minimumStok;
  bool? isRemainStok;
  bool? isFavorite;

  int? outletId;
  String? namaOutlet;

  String? foto;

  int? createdById;
  String? createdAt;

  ProdukModel(
      {this.id,
      this.kodeProduk,
      this.namaProduk,
      this.kategoriId,
      this.namaKategori,
      this.kategoriBeratId,
      this.namaKategoriBerat,
      this.beratProduk,
      this.ukuran,
      this.isSpecial,
      this.merkId,
      this.namaMerk,
      this.satuanId,
      this.namaSatuan,
      this.keterangan,
      this.hargaJual,
      this.hargaBeli,
      this.jumlahStok,
      this.minimumStok,
      this.isRemainStok,
      this.isFavorite,
      this.outletId,
      this.namaOutlet,
      this.foto,
      this.createdById,
      this.createdAt});

  ProdukModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    kodeProduk = json['kode_produk'];
    namaProduk = json['nama_produk'];

    kategoriId = json['kategori_id'];
    namaKategori = json['kategori']['nama_kategori'];

    kategoriBeratId = json['kategori_berat_id'];
    namaKategoriBerat = json['kategori_berat']['nama_kategori_berat'];

    beratProduk = json['berat_produk'];
    ukuran = json['ukuran'];
    isSpecial = json['is_special'];

    merkId = json['merk_id'];
    namaMerk = json['merk']['nama_merk'];

    satuanId = json['satuan_id'];
    namaSatuan = json['satuan']['nama_satuan'];

    keterangan = json['keterangan'];
    hargaJual = json['harga_jual'];
    hargaBeli = json['harga_beli'];
    jumlahStok = json['jumlah_stok'];
    minimumStok = json['minimum_stok'];
    isRemainStok = json['is_remain_stok'];
    isFavorite = json['is_favorite'];

    outletId = json['outlet_id'];
    namaOutlet = json['outlet']['nama_outlet'];

    foto = json['foto'];

    createdById = json['created_by_id'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['kode_produk'] = this.kodeProduk;
    data['nama_produk'] = this.namaProduk;

    data['kategori_id'] = this.kategoriId;
    data['nama_kategori'] = this.namaKategori;

    data['kategori_berat_id'] = this.kategoriBeratId;
    data['nama_kategori_berat'] = this.namaKategoriBerat;

    data['berat_produk'] = this.beratProduk;
    data['ukuran'] = this.ukuran;
    data['is_special'] = this.isSpecial;

    data['merk_id'] = this.merkId;
    data['nama_merk'] = this.namaMerk;

    data['satuan_id'] = this.satuanId;
    data['nama_satuan'] = this.namaSatuan;

    data['keterangan'] = this.keterangan;
    data['harga_jual'] = this.hargaJual;
    data['harga_beli'] = this.hargaBeli;
    data['jumlah_stok'] = this.jumlahStok;
    data['minimum_stok'] = this.minimumStok;
    data['is_remain_stok'] = this.isRemainStok;
    data['is_favorite'] = this.isFavorite;

    data['outlet_id'] = this.outletId;
    data['nama_outlet'] = this.namaOutlet;

    data['foto'] = this.foto;
    
    data['created_by_id'] = this.createdById;
    data['created_at'] = this.createdAt;
    return data;
  }

  static List<ProdukModel> fromJsonList(List list) {
    return list.map((item) => ProdukModel.fromJson(item)).toList();
  }
}
