import 'package:data_table_2/data_table_2.dart';
import 'package:dpkfrontend/app/supplier/data/supplier_model.dart';
import 'package:dpkfrontend/app/supplier/data/supplier_service.dart';
import 'package:dpkfrontend/app/supplier/page/supplier_edit.dart';
import 'package:dpkfrontend/app/user/user_service.dart';
import 'package:dpkfrontend/utils/api_service.dart';
import 'package:dpkfrontend/utils/app_model.dart';
import 'package:dpkfrontend/utils/app_service.dart';
import 'package:dpkfrontend/utils/app_widget.dart';
import 'package:dpkfrontend/widgets/template/layout/base.dart';
import 'package:dpkfrontend/widgets/template/widget/account.dart';
import 'package:dpkfrontend/widgets/template/widget/drawer.dart';
import 'package:dpkfrontend/widgets/template/widget/header.dart';
import 'package:dpkfrontend/widgets/template/widget/search.dart';
import 'package:flutter/material.dart';

import '../../../style.dart';

class SupplierList extends StatefulWidget {
  const SupplierList({Key? key}) : super(key: key);

  @override
  _SupplierListState createState() => _SupplierListState();
}

class _SupplierListState extends State<SupplierList> {
  final _appService = AppService<SupplierModel>();
  final _service = SupplierService();
  AppModel _appModel = AppModel();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _initState();
  }

  @override
  Widget build(BuildContext context) {
    return TemplateBase(
      header: TemplateWidgetHeader(
        title: "Supplier",
        searchWidget: TemplateWidgetSearch(),
        accountWidget: TemplateWidgetAccount(),
      ),
      content: content(),
      drawer: TemplateWidgetDrawer(),
    );
  }

  void _initState() {
    _appModel = _appService.initState(
      context: context,
      title: 'Kelola Supplier',
      apiEndPoint: 'supplier',
    );
  }

  Widget content() => BuildListLayout(children: [
        SubHeadingListSection(
          title: _appModel.title!,
          onPressed: () async => {
            // Navigate to create page
            await Navigator.pushNamed(context, '/supplier-create')
                .then((value) => {if (value == true) setState(() {})}),
          },
        ),
        buildListSection()
      ]);

  Widget buildListSection() => FutureBuilder<List<SupplierModel>>(
        future: _appService.getListData(_service, _appModel.token!),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            List<SupplierModel> data = snapshot.data!;

            return SizedBox(
              width: double.infinity,
              child: DataTable2(
                  columnSpacing: styleDefaultPadding,
                  minWidth: 450,
                  columns: dataColumnCustom([
                    'Nama Supplier',
                    'No Telephone',
                    'Alamat',
                    'Email',
                    'Nama Sales',
                    'No Rekening',
                    ''
                  ]),
                  rows: buildDataRow(data)),
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      );

  List<DataRow> buildDataRow(List<SupplierModel> rows) {
    List<DataRow> results = [];

    rows.forEach((row) {
      results.add(DataRow(
        cells: [
          DataCell(Text(row.namaSupplier!)),
          DataCell(Text(row.telephone!)),
          DataCell(Text(row.alamat!)),
          DataCell(Text(row.email!)),
          DataCell(Text(row.namaSales!)),
          DataCell(Text(row.noRekening!)),
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

  void _runPopupMenu(Map<String, dynamic> item) async {
    switch (item['action']) {
      case 'edit':
        // print('edit');
        // print(item['data'].id);
        print(item['data']);
        await Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => SupplierEdit(
                      supplierModel: item["data"],
                    )));
        break;
      case 'delete':
        await _showDeleteDialog(item['data'].namaSupplier, item['data'].id);
        break;
    }
  }

  Future<bool> _showDeleteDialog(String item, int id) async {
    bool isRefresh = false;
    final api = ApiService();
    final _endPoint = 'supplier';
    final _token = UserService().getTokenString(context);
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
}
