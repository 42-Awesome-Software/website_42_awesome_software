import 'package:flutter/material.dart';
import 'package:website_42_awesome_software/src/home/home_page.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(brightness: Brightness.light),
      onGenerateRoute: (RouteSettings routeSettings) {
        return MaterialPageRoute<void>(
          builder: (BuildContext context) {
            switch (routeSettings.name) {
              case HomePage.routeName:
                return const HomePage();

              default:
                return const HomePage();
            }
          },
        );
      },
    );
  }
}
