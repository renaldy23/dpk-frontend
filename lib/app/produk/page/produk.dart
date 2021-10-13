import 'package:flutter/material.dart';

import '/widgets/template/base.dart';
import '/widgets/template/header.dart';
import '/widgets/template/search.dart';
import '/widgets/template/account.dart';
import '/widgets/template/drawer.dart';

class ProdukPage extends StatelessWidget {
  const ProdukPage({
    Key? key,
    required this.content,
  }) : super(key: key);

  final Widget content;

  @override
  Widget build(BuildContext context) {
    return TemplateBase(
      drawer: DrawerMenu(),
      header: TemplateHeader(
        title: 'Kelola Produk',
        searchWidget: TemplateSearch(),
        accountWidget: TemplateAccount(),
      ),
      content: content,
    );
  }
}
