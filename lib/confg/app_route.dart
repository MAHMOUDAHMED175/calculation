import 'package:cache_repo/features/clients/presentaion/views/clients.dart';
import 'package:cache_repo/features/clients/presentaion/views/new_clients.dart';
import 'package:cache_repo/features/home_page/presentaion/views/home_page_view.dart';
import 'package:cache_repo/features/representatives/presentaion/views/new_representatives.dart';
import 'package:cache_repo/features/representatives/presentaion/views/representatives.dart';
import 'package:cache_repo/features/representatives/presentaion/views/view_representatives.dart';
import 'package:cache_repo/features/sell/presentaion/views/sell.dart';
import 'package:cache_repo/features/store/presentaion/views/count_product.dart';
import 'package:cache_repo/features/store/presentaion/views/new_product.dart';
import 'package:cache_repo/features/store/presentaion/views/store.dart';
import 'package:cache_repo/features/store/presentaion/views/view_product.dart';
import 'package:cache_repo/features/store/presentaion/views_models/managers/cubit/cubit.dart';
import 'package:cache_repo/features/suppliers/presentaion/views/money_suppliers.dart';
import 'package:cache_repo/features/suppliers/presentaion/views/new_suppliers.dart';
import 'package:cache_repo/features/suppliers/presentaion/views/suppliers.dart';
import 'package:cache_repo/features/suppliers/presentaion/views/view_payment_suppliers.dart';
import 'package:cache_repo/features/suppliers/presentaion/views/view_suppliers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../features/buy/presentaion/views/buy.dart';
import '../features/clients/presentaion/views/money_clients.dart';
import '../features/clients/presentaion/views/view_clients.dart';
import '../features/clients/presentaion/views/view_payment_clients.dart';
import '../features/splash/presentaion/views/splash_view.dart';

abstract class AppRoute {
  static const String homePage = '/homePage';
  //store
  static const String store = '/Store';
  static const String newProduct = '/NewProduct';
  static const String newSuppliers = '/NewSuppliers';
  static const String newClients = '/NewClients';
  static const String newRepresentatives = '/newRepresentatives';
  static const String moneySuppliers = '/moneySuppliers';
  static const String moneyClients = '/moneyClients';
  static const String viewProduct = '/ViewProduct';
  static const String viewSuppliers = '/ViewSuppliers';
  static const String viewClients = '/ViewClients';
  static const String viewPaymentSuppliers = '/ViewPaymentSuppliers';
  static const String viewPaymentClients = '/ViewPaymentClients';
  static const String viewRepresentatives = '/ViewRepresentatives';
  static const String countProduct = '/CountProduct';
  static const String Representatives = '/Representatives';
  static const String Supplier = '/Supplier';
  static const String Client = '/Client';



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
        path: newRepresentatives,
        builder: (BuildContext context, GoRouterState state) {
          return  NewRepresentatives();
        },
      ),
      GoRoute(
        path: moneySuppliers,
        builder: (BuildContext context, GoRouterState state) {
          return  MoneySuppliers();
        },
      ),
      GoRoute(
        path: moneyClients,
        builder: (BuildContext context, GoRouterState state) {
          return  MoneyClients();
        },
      ),
      GoRoute(
        path: newSuppliers,
        builder: (BuildContext context, GoRouterState state) {
          return  NewSuppliers();
        },
      ),
      GoRoute(
        path: newClients,
        builder: (BuildContext context, GoRouterState state) {
          return  NewClients();
        },
      ),
      GoRoute(
        path: viewProduct,
        builder: (BuildContext context, GoRouterState state) {
          return  ViewProduct();
        },
      ),
      GoRoute(
        path: viewPaymentSuppliers,
        builder: (BuildContext context, GoRouterState state) {
          return  ViewPaymentSuppliers();
        },
      ),
      GoRoute(
        path: viewPaymentClients,
        builder: (BuildContext context, GoRouterState state) {
          return  ViewPaymentClients();
        },
      ),
      GoRoute(
        path: viewSuppliers,
        builder: (BuildContext context, GoRouterState state) {
          return  ViewSuppliers();
        },
      ),
      GoRoute(
        path: viewClients,
        builder: (BuildContext context, GoRouterState state) {
          return  ViewClients();
        },
      ),
      GoRoute(
        path: viewRepresentatives,
        builder: (BuildContext context, GoRouterState state) {
          return  ViewRepresentatives();
        },
      ),
      GoRoute(
        path: countProduct,
        builder: (BuildContext context, GoRouterState state) {
          return  CountProduct();
        },
      ),
      GoRoute(
        path: Representatives,
        builder: (BuildContext context, GoRouterState state) {
          return  Representative();
        },
      ),
      GoRoute(
        path: Supplier,
        builder: (BuildContext context, GoRouterState state) {
          return  Suppliers();
        },
      ),
      GoRoute(
        path: Client,
        builder: (BuildContext context, GoRouterState state) {
          return  Clients();
        },
      ),






      GoRoute(
        path: sell,
        builder: (BuildContext context, GoRouterState state) {
          return  Sell();
        },
      ),
      GoRoute(
        path: buy,
        builder: (BuildContext context, GoRouterState state) {
          return  Buy();
        },
      ),
    ],
  );
}
