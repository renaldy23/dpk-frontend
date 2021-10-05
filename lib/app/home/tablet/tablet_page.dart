import 'package:dpkfrontend/app/home/list_data/email_page.dart';
import 'package:dpkfrontend/app/home/list_data/list_of_emails.dart';
import 'package:flutter/material.dart';

class TabletPage extends StatelessWidget {
  const TabletPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 6,
          child: ListData(),
        ),
        Expanded(
          flex: 9,
          child: EmailPage(),
        ),
      ],
    );
  }
}
