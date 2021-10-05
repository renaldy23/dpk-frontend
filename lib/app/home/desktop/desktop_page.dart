import 'package:dpkfrontend/app/home/list_data/email_page.dart';
import 'package:dpkfrontend/app/home/list_data/list_of_emails.dart';
import 'package:flutter/material.dart';

import '../side_menu/side_menu.dart';
import '/app/user/user_service.dart';

// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import '/app/user/user_view_model.dart';

class DesktopPage extends StatefulWidget {
  const DesktopPage({Key? key}) : super(key: key);

  @override
  State<DesktopPage> createState() => _DesktopPageState();
}

class _DesktopPageState extends State<DesktopPage> {
  final userService = UserService();

  @override
  Widget build(BuildContext context) {
    // final userViewModel = context.read(userViewModelProvider.notifier);
    Size _size = MediaQuery.of(context).size;
    return Row(
      children: [
        // Once our width is less then 1300 then it start showing errors
        // Now there is no error if our width is less then 1340
        Expanded(
          flex: _size.width > 1340 ? 2 : 4,
          child: SideMenu(),
        ),
        Expanded(
          flex: _size.width > 1340 ? 3 : 5,
          child: ListData(),
        ),
        Expanded(
          flex: _size.width > 1340 ? 8 : 10,
          child: EmailPage(),
        ),
      ],
    );
  }
}
