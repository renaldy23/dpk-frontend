import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            child: Image.asset("assets/images/logo.png"),
          ),
          DrawerListTile(
            title: "Dashboard",
            svgSrc: "assets/icons/menu_dashbord.svg",
            press: () => Navigator.pushNamed(context, '/home'),
          ),
          DrawerListTile(
            title: "Kelola Produk",
            svgSrc: "assets/icons/drop_box.svg",
            // press: () => Navigator.of(context).pushNamedAndRemoveUntil('/kelola-produk', ModalRoute.withName('/')),
            press: () => Navigator.pushNamed(context, '/kelola-produk'),
          ),
          DrawerListTile(
            title: "Pesan Barang",
            svgSrc: "assets/icons/truck.svg",
            press: () {},
          ),
          DrawerListTile(
            title: "Transaksi",
            svgSrc: "assets/icons/transaction.svg",
            press: () {},
          ),

          // DrawerListTile(
          //   title: "Pelanggan",
          //   svgSrc: "assets/icons/menu_profile.svg",
          //   press: () {},
          // ),


          // DrawerListTile(
          //   title: "Task",
          //   svgSrc: "assets/icons/menu_task.svg",
          //   press: () {},
          // ),
          // DrawerListTile(
          //   title: "Documents",
          //   svgSrc: "assets/icons/menu_doc.svg",
          //   press: () {},
          // ),
          
          // DrawerListTile(
          //   title: "Notification",
          //   svgSrc: "assets/icons/menu_notification.svg",
          //   press: () {},
          // ),
          
          DrawerListTile(
            title: "Pengaturan",
            svgSrc: "assets/icons/menu_setting.svg",
            press: () {},
          ),
        ],
      ),
    );
  }
}

class DrawerListTile extends StatelessWidget {
  const DrawerListTile({
    Key? key,
    // For selecting those three line once press "Command+D"
    required this.title,
    required this.svgSrc,
    required this.press,
  }) : super(key: key);

  final String title, svgSrc;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: press,
      horizontalTitleGap: 0.0,
      leading: SvgPicture.asset(
        svgSrc,
        color: Colors.white54,
        height: 16,
      ),
      title: Text(
        title,
        style: TextStyle(color: Colors.white54),
      ),
    );
  }
}
