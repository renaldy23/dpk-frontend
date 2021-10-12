import 'package:data_table_2/data_table_2.dart';
// import 'package:dpkfrontend/app/api/api_service.dart';
import 'package:dpkfrontend/app/produk/produk_model.dart';
import 'package:dpkfrontend/app/produk/produk_service.dart';
import 'package:dpkfrontend/app/user/user_service.dart';
import 'package:dpkfrontend/style.dart';
import 'package:flutter/material.dart';

class KelolaProdukTable extends StatefulWidget {
  const KelolaProdukTable({
    Key? key,
  }) : super(key: key);

  @override
  State<KelolaProdukTable> createState() => _KelolaProdukTableState();
}

class _KelolaProdukTableState extends State<KelolaProdukTable> {
  // List<ProdukModel> _data = [];

  @override
  void initState() {
    // _getData();
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
          // Text(
          //   "Recent Files",
          //   style: Theme.of(context).textTheme.subtitle1,
          // ),

          FutureBuilder<List<ProdukModel>>(
            future: _getData(),
            builder: (ctx, snapshot) {
              if (snapshot.hasData) {
                List<ProdukModel> data = snapshot.data!;
                return SizedBox(
                  width: double.infinity,
                  child: DataTable2(
                    columnSpacing: styleDefaultPadding,
                    minWidth: 600,
                    columns: [
                      DataColumn(
                        label: Text("Kode"),
                      ),
                      DataColumn(
                        label: Text("Nama Produk"),
                      ),
                      DataColumn(
                        label: Text("Stok"),
                      ),
                      DataColumn(
                        label: Container(),
                      ),
                    ],
                    rows: data
                        .map(
                          (data) => DataRow(
                            cells: [
                              DataCell(
                                Text(
                                  data.kodeProduk!,
                                ),
                              ),
                              DataCell(
                                Text(data.namaProduk!),
                              ),
                              DataCell(
                                Text(data.jumlahStok.toString()),
                              ),
                              DataCell(
                                Align(
                                  alignment: Alignment.centerRight,
                                  child: PopupMenuButton<Map<String, dynamic>>(
                                    onSelected: (val) => _runPopupMenu(val),
                                    itemBuilder: (ctx) => [
                                      PopupMenuItem<Map<String, dynamic>>(
                                          value: {'action': 'edit', 'data': data},
                                          child: Text('Edit')),
                                      PopupMenuItem<Map<String, dynamic>>(value: {
                                        'action': 'delete',
                                        'data': data
                                      }, child: Text('Delete')),
                                    ],
                                  ),
                                ),
                                // showEditIcon: true,
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

  void _runPopupMenu(Map<String, dynamic> item) {
    switch (item['action']) {
      case 'edit':
        print('edit');
        print(item['data'].id);
        break;
      case 'delete':
        break;
    }
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
