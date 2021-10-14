import 'package:data_table_2/data_table_2.dart';
import 'package:dpkfrontend/utils/api_service.dart';
import 'package:dpkfrontend/app/produk/data/produk_model.dart';
import 'package:dpkfrontend/app/produk/data/produk_service.dart';
import 'package:dpkfrontend/app/user/user_service.dart';
import 'package:dpkfrontend/style.dart';
import 'package:dpkfrontend/utils/utils.dart';
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
  // Initialize
  final _userService = UserService();
  final String _endPoint = 'produk';
  String _token = '';

  @override
  void initState() {
    super.initState();
    _initState();
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
        children: [subHeadingSection(), tableSection()],
      ),
    );
  }

  // Widgets
  Widget subHeadingSection() => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("Kelola Produk", style: Theme.of(context).textTheme.subtitle1),
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
      );

  Widget tableSection() => FutureBuilder<List<ProdukModel>>(
        future: _getData(),
        builder: (ctx, snapshot) {
          if (snapshot.hasData) {
            List<ProdukModel> data = snapshot.data!;

            print(data[0].toJson());

            return SizedBox(
              width: double.infinity,
              child: DataTable2(
                columnSpacing: styleDefaultPadding,
                minWidth: 450,
                columns: dataColumn(),
                rows: dataRow(data),
              ),
            );
          } else {
            return Container();
          }
        },
      );

  List<DataColumn> dataColumn() => [
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
      ];

  List<DataRow> dataRow(List<ProdukModel> rows) {
    List<DataRow> results = [];

    rows.forEach((row) {
      results.add(DataRow(
        cells: [
          DataCell(
            Text(
              row.namaProduk!,
            ),
          ),
          if (Responsive.isDesktop(context))
            DataCell(
              Text(row.namaKategori!.toString()),
            ),
          DataCell(
            Text(row.hargaJual.toString()),
          ),
          DataCell(
            Text(row.jumlahStok.toString()),
          ),
          if (Responsive.isDesktop(context))
            DataCell(
              Text(row.namaMerk.toString()),
            ),
          if (Responsive.isDesktop(context))
            DataCell(
              // Text(row.isFavorite.toString()),
              CheckboxListTileUtils(
                title: Container(),
                value: row.isFavorite!,
                onChanged: null,
              ),
            ),
          DataCell(
            popupMenu(row),
            placeholder: true,
          ),
        ],
      ));
    });
    return results;
  }

  Widget popupMenu(data) => Align(
        alignment: Alignment.centerRight,
        child: PopupMenuButton<Map<String, dynamic>>(
          onSelected: (val) => _runPopupMenu(val),
          itemBuilder: (ctx) => [
            PopupMenuItem<Map<String, dynamic>>(
                value: {'action': 'edit', 'data': data}, child: Text('Edit')),
            PopupMenuItem<Map<String, dynamic>>(
                value: {'action': 'delete', 'data': data},
                child: Text('Delete')),
          ],
        ),
      );

  // Function
  Future _initState() async {
    _token = _userService.getTokenString(context);
  }

  void _runPopupMenu(Map<String, dynamic> item) async {
    switch (item['action']) {
      case 'edit':
        // print('edit');
        // print(item['data'].id);
        await Navigator.pushNamed(context, '/produk-update',
            arguments: {"data": item['data']}).then((isRefresh) {
              if (isRefresh == true) setState(() {}); 
            });
        break;
      case 'delete':
        await _showDeleteDialog(item['data'].namaProduk, item['data'].id);
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

  // EOF
}
