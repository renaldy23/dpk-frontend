import 'package:dpkfrontend/pub/shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:global_configuration/global_configuration.dart';

import '/style.dart';
import '/pub/global_configuration/global_configuration.dart';

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
      theme: ThemeData.dark().copyWith(
      // theme: ThemeData.light().copyWith(
        scaffoldBackgroundColor: styleBgColor,
        textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme)
            .apply(bodyColor: Colors.white),
        canvasColor: styleSecondaryColor,
      ),
      onGenerateRoute: router.generateRoute,
      initialRoute: '/',
    );
  }
}
