import 'package:dpkfrontend/app/home/page/home.dart';
import 'package:dpkfrontend/app/produk/page/produk_create.dart';
import 'package:dpkfrontend/app/produk/page/produk_list.dart';
import 'package:dpkfrontend/app/produk/page/produk_update.dart';
import 'package:dpkfrontend/app/supplier/supplier_page.dart';
import 'package:dpkfrontend/widgets/page/page_not_found.dart';
import 'package:dpkfrontend/widgets/template/layout/dashboard.dart';
import 'package:flutter/material.dart';

import 'app/home/page/landing.dart';
import '/app/user/login_page.dart';

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

    // Master
    // case '/kategori':
    //   return MaterialPageRoute(builder: (context) => KategoriPage());

    case '/supplier':
      return MaterialPageRoute(
        builder: (context) => SupplierPage(),
      );

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
