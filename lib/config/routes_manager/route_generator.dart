import 'package:ecommerce_app/config/routes_manager/routes.dart';
import 'package:flutter/material.dart';

import '../../features/auth/sign_in/feature/page/sign_in_screen.dart';

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {

      case Routes.signInRoute:
        return MaterialPageRoute(builder: (_) => const SignInScreen());

      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: const Text('No Route Found'),
        ),
        body: const Center(child: Text('No Route Found')),
      ),
    );
  }
}
