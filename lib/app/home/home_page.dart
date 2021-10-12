import 'package:dpkfrontend/app/home/home_dashboard.dart';
// import 'package:dpkfrontend/app/home/home_view_model.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:provider/provider.dart';

import '/utils/responsive/responsive.dart';
// import '/app/home/menu/menu_controller.dart';

// import '/app/home/desktop/desktop_page.dart';
// import '/app/home/mobile/mobile_page.dart';
// import '/app/home/tablet/tablet_page.dart';

import '../dashboard/side_menu.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  
    return Scaffold(
      key: _scaffoldKey,
      drawer: SideMenu(),
      body: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // We want this side menu only for large screen
            if (Responsive.isDesktop(context))
              Expanded(
                // default flex = 1
                // and it takes 1/6 part of the screen
                child: SideMenu(),
              ),
            Expanded(
              // It takes 5/6 part of the screen
              flex: 5,
              child: HomeDashboard(),
            ),
          ],
        ),
      ),
    );
  }
}
