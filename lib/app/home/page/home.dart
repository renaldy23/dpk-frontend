
import 'package:dpkfrontend/widgets/template/widget/account.dart';
import 'package:dpkfrontend/widgets/template/widget/drawer.dart';
import 'package:flutter/material.dart';

import '../../../widgets/template/layout/base.dart';
import '../../../widgets/template/widget/header.dart';
import '../../../widgets/template/widget/search.dart';

class HomePage extends StatelessWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TemplateBase(
      drawer: TemplateWidgetDrawer(),
      header: TemplateWidgetHeader(
        title: 'Base',
        searchWidget: TemplateWidgetSearch(),
        accountWidget: TemplateWidgetAccount(),
      ),
      content: HomeContent(),
    );
  }
}

class HomeContent extends StatefulWidget {
  const HomeContent({ Key? key }) : super(key: key);

  @override
  _HomeContentState createState() => _HomeContentState();
}

class _HomeContentState extends State<HomeContent> {
  @override
  Widget build(BuildContext context) {
    return Container(
      
    );
  }
}