// import 'dart:js';

import 'package:dpkfrontend/app/kategori/kategori_page.dart';
import 'package:dpkfrontend/app/produk/kelola_produk_page.dart';
import 'package:dpkfrontend/app/produk/produk_create_page.dart';
import 'package:dpkfrontend/app/supplier/supplier_page.dart';
import 'package:dpkfrontend/utils/page/page_not_found.dart';
import 'package:flutter/material.dart';

import '/app/home/landing_page.dart';
import '/app/home/home_page.dart';
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

    // Kelola Produk
    case '/kelola-produk':
      return MaterialPageRoute(builder: (context) => KelolaProdukPage());

    // Produk
    case '/produk-create':
      return MaterialPageRoute(builder: (context) => ProdukCreatePage());

    // Master
    case '/kategori':
      return MaterialPageRoute(builder: (context) => KategoriPage());

    case '/supplier':
      return MaterialPageRoute(builder: (context) => SupplierPage());

    default:
      return MaterialPageRoute(builder: (context) => PageNotFound());
  }
}
