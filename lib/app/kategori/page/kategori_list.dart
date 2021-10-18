// Import section
import 'package:flutter/material.dart';
import 'package:data_table_2/data_table_2.dart';
import '/app/kategori/data/kategori_model.dart';
import '/app/kategori/data/kategori_service.dart';
import '/style.dart';
import '/utils/app_service.dart';
import '/utils/app_widget.dart';

import '/utils/app_model.dart';

class KategoriList extends StatefulWidget {
  const KategoriList({Key? key}) : super(key: key);

  @override
  _KategoriListState createState() => _KategoriListState();
}

class _KategoriListState extends State<KategoriList> {
  // Global variable & initialize
  final _appService = AppService<KategoriModel>();
  final _service = KategoriService();
  AppModel _appModel = AppModel();

  @override
  void initState() {
    super.initState();
    _initState();
  }

  @override
  Widget build(BuildContext context) {
    return BuildListLayout(children: [
      // Sub heading
      SubHeadingListSection(
        title: _appModel.title!,
        onPressed: () async => {
          // Navigate to create page
          await Navigator.pushNamed(context, '/kategori-create')
              .then((value) => {if (value == true) setState(() {})}),
        },
      ),

      // Table section
      buildListSection(),
    ]);
  }

  // Fuction & widgets
  void _initState() {
    _appModel = _appService.initState(
      context: context,
      title: 'Kategori',
      apiEndPoint: 'kategori',
    );
  }

  Widget buildListSection() => FutureBuilder<List<KategoriModel>>(
        future: _appService.getListData(_service, _appModel.token!),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            List<KategoriModel> data = snapshot.data!;

            return SizedBox(
              width: double.infinity,
              child: DataTable2(
                columnSpacing: styleDefaultPadding,
                minWidth: 450,
                columns: dataColumnCustom(['ID', 'Nama Kategori', '']),
                rows: buildDataRow(data),
              ),
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      );

  List<DataRow> buildDataRow(List<KategoriModel> rows) {
    List<DataRow> results = [];

    rows.forEach((row) {
      results.add(DataRow(
        cells: [
          DataCell(Text(row.id.toString())),
          DataCell(Text(row.namaKategori!)),
          DataCell(
            PopupMenuCustom(
              data: row,
              onSelected: (val) => buildDataRowCommand(val),
            ),
            placeholder: true,
          ),
        ],
      ));
    });

    return results;
  }

  void buildDataRowCommand(Map<String, dynamic> val) async {
    switch (val['action']) {
      case 'edit':
        await Navigator.pushNamed(context, '/kategori-update',
            arguments: {"data": val['data']}).then((isRefresh) {
          if (isRefresh == true) setState(() {});
        });
        break;
      case 'delete':
        await showDeleteDialog(
          context: context,
          id: val['data'].id,
          item: val['data'].namaKategori,
          apiEndPoint: _appModel.apiEndPoint!,
          token: _appModel.token!,
        ).then((value) {
          if (value) setState(() {});
        });

        break;
    }
  }

  // EOF
}
