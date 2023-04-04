import 'package:cache_repo/features/buy/presentaion/views/buy.dart';
import 'package:cache_repo/features/home_page/presentaion/views/home_page_view.dart';
import 'package:cache_repo/features/sell/presentaion/views/sell.dart';
import 'package:cache_repo/features/store/presentaion/views/count_product.dart';
import 'package:cache_repo/features/store/presentaion/views/new_product.dart';
import 'package:cache_repo/features/store/presentaion/views/store.dart';
import 'package:cache_repo/features/store/presentaion/views/view_product.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../features/splash/presentaion/views/splash_view.dart';

abstract class AppRoute {
  static const String homePage = '/homePage';
  //store
  static const String store = '/Store';
  static const String newProduct = '/NewProduct';
  static const String viewProduct = '/ViewProduct';
  static const String countProduct = '/CountProduct';



  static const String buy = '/Buy';
  static const String sell = '/Sell';

  static final GoRouter router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) {
          return const SplashView();
        },
      ),
      GoRoute(
        path: homePage,
        builder: (BuildContext context, GoRouterState state) {
          return const HomePage();
        },
      ),

      //sotre,new,view and count product
      GoRoute(
        path: store,
        builder: (BuildContext context, GoRouterState state) {
          return const StoreApp();
        },
      ),
      GoRoute(
        path: newProduct,
        builder: (BuildContext context, GoRouterState state) {
          return  NewProduct();
        },
      ),
      GoRoute(
        path: viewProduct,
        builder: (BuildContext context, GoRouterState state) {
          return  ViewProduct();
        },
      ),
      GoRoute(
        path: countProduct,
        builder: (BuildContext context, GoRouterState state) {
          return  CountProduct();
        },
      ),






      GoRoute(
        path: sell,
        builder: (BuildContext context, GoRouterState state) {
          return const Sell();
        },
      ),
      GoRoute(
        path: buy,
        builder: (BuildContext context, GoRouterState state) {
          return const Buy();
        },
      ),
    ],
  );
}
