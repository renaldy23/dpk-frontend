import 'package:flutter/material.dart';
import '/utils/responsive/responsive.dart';
import '/app/dashboard/dashboard_menu_profile.dart';
import '/app/dashboard/dashboard_search.dart';


class HomeHeader extends StatelessWidget {
  const HomeHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (!Responsive.isDesktop(context))
          IconButton(
            icon: Icon(Icons.menu),
            // onPressed: context.read<MenuController>().controlMenu,
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        if (!Responsive.isMobile(context))
          Text(
            "Dashboard",
            style: Theme.of(context).textTheme.headline6,
          ),
        if (!Responsive.isMobile(context))
          Spacer(flex: Responsive.isDesktop(context) ? 2 : 1),
        Expanded(
          child: DashboardSearch(),
        ),
        DashboardMenuProfile()
      ],
    );
  }
}
