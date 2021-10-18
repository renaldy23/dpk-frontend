// import '/app/home/side_menu/side_menu.dart';
import '/widgets/base/responsive.dart';
import 'package:flutter/material.dart';

class SupplierPage extends StatefulWidget {
  const SupplierPage({Key? key}) : super(key: key);

  @override
  _SupplierPageState createState() => _SupplierPageState();
}

class _SupplierPageState extends State<SupplierPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('Supplier'),
      ),
      body: Responsive(
        mobile: _buildContent(),
        tablet: _buildDesktop(size),
        desktop: _buildDesktop(size),
      ),
    );
  }

  // Local
  Widget _buildDesktop(Size size) {
    return Container();
    // Menu, Content
    // return ResponsiveDesktop(
    //   size: size,
    //   menu: SideMenu(),
    //   content: _buildContent(),
    // );
  }

  Widget _buildContent() {
    // Content
    return Container();
  }
}
