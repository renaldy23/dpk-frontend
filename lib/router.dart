import 'package:dpkfrontend/app/home/landing_page.dart';
import 'package:flutter/material.dart';

import '/app/home/home_page.dart';
import '/app/user/login_page.dart';


Route<dynamic> generateRoute(RouteSettings routeSettings) {
  // print(routeSettings.name);

  switch (routeSettings.name) {
    case '/':
      return MaterialPageRoute(builder: (context) => LandingPage());
    case '/home':
      return MaterialPageRoute(builder: (context) => HomePage());
    case '/login':
      return MaterialPageRoute(builder: (context) => LoginPage());
    default: 
      return MaterialPageRoute(builder: (context) => HomePage());
  }
}
