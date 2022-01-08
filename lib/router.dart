import 'package:dpkfrontend/app/supplier/page/supplier_create.dart';
import 'package:dpkfrontend/app/supplier/page/supplier_list.dart';
import '/app/home/page/home.dart';
import '/widgets/page/page_not_found.dart';
import 'package:flutter/material.dart';
import '/app/home/page/landing.dart';
import '/app/user/login_page.dart';

Route<dynamic> generateRoute(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case '/':
      return MaterialPageRoute(builder: (context) => LandingPage());
    case '/login':
      return MaterialPageRoute(builder: (context) => LoginPage());
    case '/home':
      return MaterialPageRoute(builder: (context) => HomePage());

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
