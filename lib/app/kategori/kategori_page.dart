import 'package:flutter/material.dart';
import 'package:dpkfrontend/style.dart';
import 'package:dpkfrontend/utils/responsive/responsive.dart';
import 'package:dpkfrontend/app/dashboard/dashboard_layout.dart';
import 'package:dpkfrontend/app/dashboard/dashboard_layout_content.dart';
import 'package:dpkfrontend/app/produk/kelola_produk_detail.dart';
import 'package:dpkfrontend/app/produk/kelola_produk_table.dart';

// import '/app/kelola_produk/kelola_produk_content.dart';

class KategoriPage extends StatelessWidget {
  const KategoriPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DashboardLayout(
      dashboard: KategoriContent(),
    );
  }
}


class KategoriContent extends StatelessWidget {
  const KategoriContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DashboardLayoutContent(
      title: 'Kategori',
      subHeading: KategoriSubHeading(
        title: 'Kategori',
        addNew: '/kategori-create',
      ),
      table: KelolaProdukTable(),
      detail: KelolaProdukDetail(
        title: "Data lainnya",
      ),
    );
  }
}

class KategoriSubHeading extends StatelessWidget {
  const KategoriSubHeading({
    Key? key,
    required this.title,
    required this.addNew,
  }) : super(key: key);

  final String title, addNew;

  @override
  Widget build(BuildContext context) {
    // final Size _size = MediaQuery.of(context).size;
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          
          children: [
           
            Text(
              this.title,
              style: Theme.of(context).textTheme.subtitle1,
            ),
            ElevatedButton.icon(
              style: TextButton.styleFrom(
                padding: EdgeInsets.symmetric(
                  horizontal: styleDefaultPadding * 1.5,
                  vertical: styleDefaultPadding /
                      (Responsive.isMobile(context) ? 2 : 1),
                ),
              ),
              icon: Icon(Icons.add),
              label: Text("Tambah $title"),
              onPressed: () => Navigator.pushNamed(context, this.addNew),
            ),
          ],
        ),
        SizedBox(height: styleDefaultPadding),

        // Responsive(
        //   mobile: FileInfoCardGridView(
        //     crossAxisCount: _size.width < 650 ? 2 : 4,
        //     childAspectRatio: _size.width < 650 && _size.width > 350 ? 1.3 : 1,
        //   ),
        //   tablet: FileInfoCardGridView(),
        //   desktop: FileInfoCardGridView(
        //     childAspectRatio: _size.width < 1400 ? 1.1 : 1.4,
        //   ),
        // ),
      ],
    );
  }
}

