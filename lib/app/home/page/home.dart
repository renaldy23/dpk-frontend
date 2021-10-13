
import 'package:flutter/material.dart';

import '/widgets/template/base.dart';
import '/widgets/template/header.dart';
import '/widgets/template/search.dart';
import '/widgets/template/account.dart';
import '../../../widgets/template/drawer.dart';

class HomePage extends StatelessWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TemplateBase(
      drawer: DrawerMenu(),
      header: TemplateHeader(
        title: 'Base',
        searchWidget: TemplateSearch(),
        accountWidget: TemplateAccount(),
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