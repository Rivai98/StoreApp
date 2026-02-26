import 'package:flutter/material.dart';
import 'package:store_app/core/routing/app_routes.dart';
import 'package:store_app/features/auth/presentation/views/login_page.dart';
import 'package:store_app/features/home/presentation/views/home_page.dart';

class AppRouter {




  Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.homeRoute:
        return MaterialPageRoute(builder: (_) => HomePage());
      case AppRoutes.loginRoute:
        return MaterialPageRoute(builder: (_) => LoginPage());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }



}