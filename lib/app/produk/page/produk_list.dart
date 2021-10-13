import 'package:data_table_2/data_table_2.dart';
import 'package:dpkfrontend/utils/api_service.dart';
// import 'package:dpkfrontend/app/api/api_service.dart';
import 'package:dpkfrontend/app/produk/data/produk_model.dart';
import 'package:dpkfrontend/app/produk/data/produk_service.dart';
import 'package:dpkfrontend/app/user/user_service.dart';
import 'package:dpkfrontend/style.dart';
import 'package:dpkfrontend/widgets/base/responsive.dart';
import 'package:flutter/material.dart';

class ProdukList extends StatefulWidget {
  const ProdukList({
    Key? key,
  }) : super(key: key);

  @override
  State<ProdukList> createState() => _ProdukListState();
}

class _ProdukListState extends State<ProdukList> {
  // List<ProdukModel> _data = [];
  final _userService = UserService();

  final String _endPoint = 'produk';
  String _token = '';

  @override
  void initState() {
    _token = _userService.getTokenString(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(styleDefaultPadding),
      decoration: BoxDecoration(
        color: styleSecondaryColor,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Sub heading
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Produk", style: Theme.of(context).textTheme.subtitle1),
              ElevatedButton.icon(
                style: TextButton.styleFrom(
                  padding: EdgeInsets.symmetric(
                    horizontal: styleDefaultPadding * 1.5,
                    vertical: styleDefaultPadding /
                        (Responsive.isMobile(context) ? 2 : 1),
                  ),
                ),
                icon: Icon(Icons.add),
                label: Text("Tambah"),
                onPressed: () => Navigator.pushNamed(context, '/produk-create'),
              ),
            ],
          ),

          // Table
          FutureBuilder<List<ProdukModel>>(
            future: _getData(),
            builder: (ctx, snapshot) {
              if (snapshot.hasData) {
                List<ProdukModel> data = snapshot.data!;
                return SizedBox(
                  width: double.infinity,
                  child: DataTable2(
                    columnSpacing: styleDefaultPadding,
                    minWidth: 450,
                    columns: [
                      DataColumn(
                        label: Text("Nama Produk"),
                      ),
                      if (Responsive.isDesktop(context))
                        DataColumn(
                          label: Text("kategori"),
                        ),
                      DataColumn(
                        label: Text("Harga Jual"),
                      ),
                      DataColumn(
                        label: Text("Stok"),
                      ),
                      if (Responsive.isDesktop(context))
                        DataColumn(
                          label: Text("Merk"),
                        ),
                      if (Responsive.isDesktop(context))
                        DataColumn(
                          label: Text("Favorit"),
                        ),
                      DataColumn(
                        label: Container(
                          width: 10,
                        ),
                      ),
                    ],
                    rows: data
                        .map(
                          (data) => DataRow(
                            cells: [
                              DataCell(
                                Text(
                                  data.namaProduk!,
                                ),
                              ),
                              if (Responsive.isDesktop(context))
                                DataCell(
                                  Text(data.kategoriId!.toString()),
                                ),
                              DataCell(
                                Text(data.hargaJual.toString()),
                              ),
                              DataCell(
                                Text(data.jumlahStok.toString()),
                              ),
                              if (Responsive.isDesktop(context))
                                DataCell(
                                  Text(data.merkId.toString()),
                                ),
                              if (Responsive.isDesktop(context))
                                DataCell(
                                  Text(data.isFavorite.toString()),
                                ),
                              DataCell(
                                Align(
                                  alignment: Alignment.centerRight,
                                  child: PopupMenuButton<Map<String, dynamic>>(
                                    onSelected: (val) => _runPopupMenu(val),
                                    itemBuilder: (ctx) => [
                                      PopupMenuItem<Map<String, dynamic>>(
                                          value: {
                                            'action': 'edit',
                                            'data': data
                                          },
                                          child: Text('Edit')),
                                      PopupMenuItem<Map<String, dynamic>>(
                                          value: {
                                            'action': 'delete',
                                            'data': data
                                          },
                                          child: Text('Delete')),
                                    ],
                                  ),
                                ),
                                // showEditIcon: true,
                                placeholder: true,
                              ),
                            ],
                          ),
                        )
                        .toList(),
                  ),
                );
              } else {
                return Container();
              }
            },
          ),
        ],
      ),
    );
  }

  void _runPopupMenu(Map<String, dynamic> item) async {
    switch (item['action']) {
      case 'edit':
        print('edit');
        print(item['data'].id);
        break;
      case 'delete':
        bool isRefresh =
            await _showDeleteDialog(item['data'].namaProduk, item['data'].id);
        print('isRefresh $isRefresh');
        // if (isRefresh)
        setState(() {
          // Force refresh
        });
        break;
    }
  }

  Future<bool> _showDeleteDialog(String item, int id) async {
    bool isRefresh = false;
    final api = ApiService();
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return AlertDialog(
            title: Text('Konfirmasi Penghapusan'),
            content: Text('Yakin mau menghapus "$item"?'),
            actions: <Widget>[
              TextButton(
                child: Text('Hapus'),
                onPressed: () async {
                  String endPoint = "$_endPoint/$id";
                  await api
                      .delete(token: _token, endPoint: endPoint)
                      .then((value) {
                    setState(() {
                      isRefresh = true;
                    });
                  });
                  print('isRefresh in delete: $isRefresh');
                  Navigator.pop(context);
                },
              ),
              TextButton(
                child: Text('Batal'),
                onPressed: () {
                  Navigator.pop(context);
                },
              )
            ],
          );
        });
    return isRefresh;
  }

  Future<List<ProdukModel>> _getData() async {
    final produkService = ProdukService();
    final userService = UserService();

    List<ProdukModel> results = [];
    String token = userService.getTokenString(context);
    await produkService
        .getListData(token: token)
        .then((value) => value.forEach((element) => results.add(element)));
    return results;
  }
}
