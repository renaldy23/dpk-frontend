import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:global_configuration/global_configuration.dart';

import '/utils/shared_preferences/shared_preferences.dart';
import '/utils/global_configuration/global_configuration.dart';

import 'router.dart' as router;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Load from assets/cfg/app_settings.json
  await GlobalConfiguration().loadFromAsset("app_settings");

  final sharedPref = await SharedPreferences.getInstance();

  runApp(ProviderScope(
    overrides: [
      sharedPrefProvider.overrideWithValue(
        SharedPrefService(sharedPref),
      )
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  final _globalConfig = GlobalConfig();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: _globalConfig.get('appTitle'),
      theme: ThemeData(),
      onGenerateRoute: router.generateRoute,
      initialRoute: '/',
    );
  }
}
