import 'package:flutter/material.dart';
import 'package:flutter_bloc_concepts/presentation/screens/second_screen.dart';
import 'package:flutter_bloc_concepts/presentation/screens/settings_screen.dart';
import 'package:flutter_bloc_concepts/presentation/screens/third_screen.dart';
import '../screens/home_screen.dart';

class AppRouter {
  Route onGenratedRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case '/':
        return MaterialPageRoute(
            builder: (_) => const HomePage(
                  title: "HomePage",
                ));
      case "/second":
        return MaterialPageRoute(
            builder: (_) =>
                const SecondPage(title: "SecondPage", color: Colors.orange));
      case "/third":
        return MaterialPageRoute(
            builder: (_) =>
                const ThirdPage(title: "ThirdPage", color: Colors.green));

      case "/settings":
        return MaterialPageRoute(builder: (_) => const SettingsScreen());

      default:
        return MaterialPageRoute(
            builder: (context) => Scaffold(
                  body: Center(
                    child: Text('No route defined for ${routeSettings.name}'),
                  ),
                ));
    }
  }
}
