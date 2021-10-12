import 'package:flutter/material.dart';
import '/utils/responsive/responsive.dart';

import 'side_menu.dart';

class DashboardLayout extends StatefulWidget {
  const DashboardLayout({Key? key, required this.dashboard})
      : super(key: key);

  final Widget dashboard;

  @override
  State<DashboardLayout> createState() => _DashboardLayoutState();
}

class _DashboardLayoutState extends State<DashboardLayout> {
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
              child: widget.dashboard,
            ),
          ],
        ),
      ),
    );
  }
}
