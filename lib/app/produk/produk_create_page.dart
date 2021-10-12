// import 'package:dpkfrontend/app/dashboard/dashboard_layout.dart';
import 'package:dpkfrontend/app/produk/produk_form.dart';
import 'package:flutter/material.dart';

class ProdukCreatePage extends StatefulWidget {
  const ProdukCreatePage({Key? key}) : super(key: key);

  @override
  _ProdukCreatePageState createState() => _ProdukCreatePageState();
}

class _ProdukCreatePageState extends State<ProdukCreatePage> {
  @override
  Widget build(BuildContext context) {
    // return DashboardLayout(dashboard: ProdukForm());
    return ProdukForm();
  }
}
