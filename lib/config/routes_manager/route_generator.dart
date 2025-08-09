import 'package:ecommerce_app/config/routes_manager/routes.dart';
import 'package:flutter/material.dart';

import '../../features/auth/presentation/page/sign_in_screen.dart';
import '../../features/auth/presentation/page/sign_up_screen.dart';
import '../../features/cart/presentation/pages/cart_screen.dart';
import '../../features/main_layout/home/domain/entities/category_or_brand_response.dart';
import '../../features/main_layout/main_layout.dart';
import '../../features/product_details/presentation/screen/product_details.dart';
import '../../features/products_screen/presentation/screens/products_screen.dart';

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {

      case Routes.signInRoute:
        return MaterialPageRoute(builder: (_) => const SignInScreen());

      case Routes.signUpRoute:
        return MaterialPageRoute(builder: (_) => const SignUpScreen());

      case Routes.cartRoute:
        return MaterialPageRoute(builder: (_) => const CartScreen());
      case Routes.mainRoute:
        return MaterialPageRoute(builder: (_) => const MainLayout());

      case Routes.productsScreenRoute:
        {
          CategoryOrBrand? categoryOrBrand = settings
              .arguments as CategoryOrBrand;
          return MaterialPageRoute(
              builder: (_) => ProductsScreen(category: categoryOrBrand,));
        }

      case Routes.productDetails:
        return MaterialPageRoute(builder: (_) => const ProductDetails());

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
