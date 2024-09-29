
import 'package:e_commerce/config/routes_manager/routes.dart';
import 'package:e_commerce/features/auth/presentation/pages/sign_in_screen.dart';
import 'package:e_commerce/features/auth/presentation/pages/sign_up_screen.dart';
import 'package:e_commerce/features/bottom_nav_bar/view/bottom_bar_screen.dart';
import 'package:e_commerce/features/product/view/product_details_screen.dart';
import 'package:e_commerce/features/product/view/product_grid_screen.dart';
import 'package:flutter/material.dart';

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {

      case Routes.bottomBar:
        return MaterialPageRoute(builder: (_) => const BottomBarScreen());
      case Routes.signInRoute:
        return MaterialPageRoute(builder: (_) =>  SignInScreen());

      case Routes.signUpRoute:
        return MaterialPageRoute(builder: (_) =>  SignUpScreen());
      case Routes.productRoute:
        return MaterialPageRoute(builder: (_) =>   const ProductGridScreen(),);
        case Routes.productDetailsRoute:
        return MaterialPageRoute(builder: (_) =>  const ProductDetailsScreen());
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
