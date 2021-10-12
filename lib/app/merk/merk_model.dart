class MerkModel {
  final int id;
  final String namaMerk;
  final int? createdBy;
  final DateTime? createdAt;

  MerkModel(
      {required this.id,
      required this.namaMerk,
      this.createdBy,
      this.createdAt});

  factory MerkModel.fromJson(Map<String, dynamic> json) {
    return MerkModel(
        id: json["id"],
        namaMerk: json["nama_merk"],
        createdBy: (json["created_by"] == null ? null : 1),
        createdAt: (json["created_at"] == null
            ? null
            : DateTime.parse(json["createdAt"])));
  }

  static List<MerkModel> fromJsonList(List list) {
    return list.map((item) => MerkModel.fromJson(item)).toList();
  }

  ///this method will prevent the override of toString
  String dataAsString() {
    return '#${this.id} ${this.namaMerk}';
  }


  ///custom comparing function to check if two users are equal
  bool isEqual(MerkModel model) {
    return this.id == model.id;
  }

  @override
  String toString() => namaMerk;

}

