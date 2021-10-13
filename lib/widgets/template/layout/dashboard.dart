import 'package:flutter/material.dart';

import 'base.dart';
import '../widget/header.dart';
import '../widget/search.dart';
import '../widget/account.dart';
import '../widget/drawer.dart';

class TemplateDashboard extends StatelessWidget {
  const TemplateDashboard({
    Key? key,
    required this.title,
    required this.content,
  }) : super(key: key);

  final String title;
  final Widget content;

  @override
  Widget build(BuildContext context) {
    return TemplateBase(
      drawer: TemplateWidgetDrawer(),
      header: TemplateWidgetHeader(
        title: this.title,
        searchWidget: TemplateWidgetSearch(),
        accountWidget: TemplateWidgetAccount(),
      ),
      content: this.content,
    );
  }
}
