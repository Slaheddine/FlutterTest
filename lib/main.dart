import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutterapptest/pages/HomePage.dart';
import 'package:flutterapptest/pages/LoginPage.dart';
import 'package:flutterapptest/pages/SplashScreen.dart';

import 'localizations/AppLocalizations.dart';
import 'utils/SizeConfig.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MarvinBook',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SplashScreen(),
      localizationsDelegates: [
        // ... app-specific localization delegate[s] here
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('fr')
      ],
      onGenerateRoute : (RouteSettings routeSettings){
        return new PageRouteBuilder<dynamic>(
            settings: routeSettings,
            pageBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) {
              switch (routeSettings.name){
                case 'login': return LoginPage();
                case 'home': return HomePage();
                default: return null;
              }
            },
            transitionDuration: const Duration(milliseconds: 300)
        );
      },
    );
  }
}
