import 'package:dpkfrontend/app/supplier/page/supplier_create.dart';
import 'package:dpkfrontend/app/supplier/page/supplier_list.dart';

import '/app/kategori/page/kategori_form.dart';

import '/app/home/page/home.dart';
import '/app/produk/page/produk_create.dart';
import '/app/produk/page/produk_list.dart';
import '/app/produk/page/produk_update.dart';
import '/widgets/page/page_not_found.dart';
import '/widgets/template/layout/dashboard.dart';
import 'package:flutter/material.dart';

import '/app/home/page/landing.dart';
import '/app/user/login_page.dart';
import '/app/kategori/page/kategori_list.dart';
// import 'app/supplier/page/supplier_list.dart';

Route<dynamic> generateRoute(RouteSettings routeSettings) {
  // print(routeSettings.name);

  switch (routeSettings.name) {
    case '/':
      return MaterialPageRoute(builder: (context) => LandingPage());
    case '/login':
      return MaterialPageRoute(builder: (context) => LoginPage());
    case '/home':
      return MaterialPageRoute(builder: (context) => HomePage());

    // Produk
    case '/produk':
      return MaterialPageRoute(
          builder: (context) => TemplateDashboard(
                title: 'Produk',
                content: ProdukList(),
              ));
    case '/produk-create':
      return MaterialPageRoute(builder: (context) => ProdukCreate());
    case '/produk-update':
      return MaterialPageRoute(
        builder: (context) => ProdukUpdate(),
        settings: routeSettings,
      );

    // Kategori
    case '/kategori':
      return MaterialPageRoute(
          builder: (context) => TemplateDashboard(
                title: 'Kategori',
                content: KategoriList(),
              ));
    case '/kategori-create':
      return MaterialPageRoute(
        builder: (context) => KategoriFormPage(isUpdate: false),
        settings: routeSettings,
      );
    case '/kategori-update':
      return MaterialPageRoute(
        builder: (context) => KategoriFormPage(isUpdate: true),
        settings: routeSettings,
      );

    case '/supplier':
      return MaterialPageRoute(
        builder: (context) => SupplierList(),
      );

    case '/supplier-create':
      return MaterialPageRoute(builder: (context) => SupplierCreate());
      

    default:
      return MaterialPageRoute(
        builder: (context) => PageNotFound(),
      );
  }
}

// class IdArguments {
//   final int id;
//   IdArguments(this.id);
// }
