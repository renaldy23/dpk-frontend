import 'package:flutter/material.dart';

// import '/utils/global_configuration/global_configuration.dart';
import '/utils/responsive/responsive.dart';

import 'desktop/desktop_page.dart';
import 'mobile/mobile_page.dart';
import 'tablet/tablet_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final _globalConfig = GlobalConfig();
    // Size _size = MediaQuery.of(context).size;
    return Scaffold(
      // appBar: AppBar(title: Text(_globalConfig.get('appTitle')),),
      body: Responsive(
        mobile: MobilePage(), 
        tablet: TabletPage(), 
        desktop: DesktopPage(),
      ),
    );
  }
}

