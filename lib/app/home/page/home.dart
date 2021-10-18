import 'package:dpkfrontend/widgets/template/layout/base.dart';
import 'package:dpkfrontend/widgets/template/widget/header.dart';
import 'package:dpkfrontend/widgets/template/widget/search.dart';
import 'package:flutter/material.dart';
import '/widgets/template/widget/account.dart';
import '/widgets/template/widget/drawer.dart';


class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TemplateBase(
      drawer: TemplateWidgetDrawer(),
      header: TemplateWidgetHeader(
        title: 'Dashboard',
        searchWidget: TemplateWidgetSearch(),
        accountWidget: TemplateWidgetAccount(),
      ),
      content: HomeContent(),
    );
  }
}

class HomeContent extends StatefulWidget {
  const HomeContent({Key? key}) : super(key: key);

  @override
  _HomeContentState createState() => _HomeContentState();
}

class _HomeContentState extends State<HomeContent> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
