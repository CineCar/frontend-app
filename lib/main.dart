import 'package:flutter/material.dart';
import 'package:frontend_app/providers/cart_provider.dart';
import 'package:frontend_app/providers/orders_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import './screens/cart_screen.dart';
import './screens/movies_overview_screen.dart';
import './screens/movie_detail_screen.dart';
import 'providers/movies_provider.dart';
import 'app_localizations.dart';
import 'providers/cart_provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: Movies(),
        ),
        ChangeNotifierProvider.value(
          value: CartProvider(),
        ),
        ChangeNotifierProvider.value(
          value: Orders(),
        ),
      ],
      child: MaterialApp(
          title: 'CineCar',
          theme: ThemeData(
            primarySwatch: Colors.deepOrange,
            accentColor: Colors.lightBlueAccent,
            fontFamily: 'Lato',
          ),
          supportedLocales: [
            Locale('en', 'US'),
            Locale('de', 'DE'),
          ],
          localizationsDelegates: [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
          ],
          localeListResolutionCallback: (locale, supportedLocales) {
            for (var supportedLocale in supportedLocales) {
              if (supportedLocale.languageCode == locale.first.languageCode &&
                  supportedLocale.countryCode == locale.first.countryCode) {
                return supportedLocale;
              }
            }
            return supportedLocales.first;
          },
          // home: new MyHomePage(),
          initialRoute: '/',
          routes: {
            '/': (ctx) => MyHomePage(),
            MovieDetailScreen.routeName: (ctx) => MovieDetailScreen(),
            CartScreen.routeName: (ctx) => CartScreen(),
          }),
    );
  }
}
