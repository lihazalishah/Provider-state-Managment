import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_app/provider/Example_one_provider.dart';
import 'package:provider_app/provider/count_provider.dart';
import 'package:provider_app/provider/favourite_item_provider.dart';
import 'package:provider_app/provider/remove_favourite_Item_provider.dart';
import 'package:provider_app/provider/theme_changer_provider.dart';

import 'package:provider_app/screen/Example_one.dart';
import 'package:provider_app/screen/count_Example.dart';
import 'package:provider_app/screen/favorite/favourite.dart';

import 'provider/auth_provider.dart';
import 'screen/Api_auth/login_screen.dart';
import 'screen/Themes/dark_theme.dart';
import 'screen/stateless_As_statefull.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      // multipleProvider
      providers: [
        ChangeNotifierProvider(create: (_) => CountProvider()), // countExample
        ChangeNotifierProvider(create: (_) => ExampleOneProvider()),
        ChangeNotifierProvider(create: (_) => FavouriteItemProvider()),
        ChangeNotifierProvider(create: (_) => RemovefavouriteItemProvider()),
        ChangeNotifierProvider(create: (_) => ThemeChanger()),
        ChangeNotifierProvider(create: (_) => AuthProvider()),
      ],
      child: Builder(
        builder: (BuildContext context) {
          // print('build complete app');
          final Theme_changer = Provider.of<ThemeChanger>(context);
          return MaterialApp(
              themeMode: Theme_changer.themeMode,
              theme: ThemeData(
                brightness: Brightness.light,
                primarySwatch: Colors.lightGreen,
              ),
              darkTheme: ThemeData(
                brightness: Brightness.dark,
                primarySwatch: Colors.grey,
                appBarTheme: const AppBarTheme(color: Colors.grey),

                iconTheme: const IconThemeData(
                    color: Colors.pink), // icon color in dark theme
              ),
              debugShowCheckedModeBanner: false,
              // home:Count_Example(),
              // home  :ExampleOneScreen(),
              home: const MyHome());
        },
      ),
    );
  }
}

class MyHome extends StatelessWidget {
  const MyHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Center(child: Text('Home screen'))),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Count_Example(),
                      ));
                },
                child: const Text('provider Count Exmaple')),
          ),
          const SizedBox(
            height: 20,
          ),
          Center(
            child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ExampleOneScreen()));
                },
                child: const Text('provider Slide Example')),
          ),
          const SizedBox(
            height: 20,
          ),
          Center(
            child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const FavouriteApp()));
                },
                child: const Text('provider Favourite App')),
          ),
          const SizedBox(
            height: 20,
          ),
          Center(
            child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const DarkthemeScreen()));
                },
                child: const Text('Theme change')),
          ),
          const SizedBox(
            height: 20,
          ),
          Center(
            child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => NofifyListerScreen()));
                },
                child: const Text(' use Stateless wid as statefull')),
          ),
          const SizedBox(
            height: 20,
          ),
          Center(
            child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LoginScreen()));
                },
                child: const Text('Login Api with provider')),
          ),
        ],
      ),
    );
  }
}
