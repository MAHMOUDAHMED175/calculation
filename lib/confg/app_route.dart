import 'package:cache_repo/features/clients/presentaion/views/clients.dart';
import 'package:cache_repo/features/clients/presentaion/views/new_clients.dart';
import 'package:cache_repo/features/expenses/presentation/views/daily_expenses.dart';
import 'package:cache_repo/features/expenses/presentation/views/expenses.dart';
import 'package:cache_repo/features/home_page/presentaion/views/home_page_view.dart';
import 'package:cache_repo/features/reports/presentation/view/reports.dart';
import 'package:cache_repo/features/reports/presentation/view/treasury_transactions_report.dart';
import 'package:cache_repo/features/representatives/presentaion/views/new_representatives.dart';
import 'package:cache_repo/features/representatives/presentaion/views/representatives.dart';
import 'package:cache_repo/features/representatives/presentaion/views/view_representatives.dart';
import 'package:cache_repo/features/buy/presentaion/views/sell.dart';
import 'package:cache_repo/features/store/presentaion/views/count_product.dart';
import 'package:cache_repo/features/store/presentaion/views/new_product.dart';
import 'package:cache_repo/features/store/presentaion/views/store.dart';
import 'package:cache_repo/features/store/presentaion/views/view_product.dart';
import 'package:cache_repo/features/suppliers/presentaion/views/money_suppliers.dart';
import 'package:cache_repo/features/suppliers/presentaion/views/new_suppliers.dart';
import 'package:cache_repo/features/suppliers/presentaion/views/suppliers.dart';
import 'package:cache_repo/features/suppliers/presentaion/views/view_payment_suppliers.dart';
import 'package:cache_repo/features/suppliers/presentaion/views/view_suppliers.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../features/sell/presentaion/views/buy.dart';
import '../features/clients/presentaion/views/money_clients.dart';
import '../features/clients/presentaion/views/view_clients.dart';
import '../features/clients/presentaion/views/view_payment_clients.dart';
import '../features/expenses/presentation/views/month_expenses.dart';
import '../features/reports/presentation/view/buying_bill_report/buying_bill_report.dart';
import '../features/reports/presentation/view/buying_bill_report/details_bill_report.dart';
import '../features/reports/presentation/view/report_company.dart';
import '../features/reports/presentation/view/selling_bill_report/details_bill_report.dart';
import '../features/reports/presentation/view/selling_bill_report/selling_bill_report.dart';
import '../features/splash/presentaion/views/splash_view.dart';

abstract class AppRoute {
  static const String homePage = '/HomePage';

  //store
  static const String store = '/Store';
  static const String buy = '/Buy';
  static const String sell = '/Sell';
  static const String Supplier = '/Supplier';
  static const String Client = '/Client';
  static const String expenses = '/Expenses';
  static const String reports = '/Reports';

  ///
  static const String newProduct = '/NewProduct';
  static const String viewProduct = '/ViewProduct';
  static const String countProduct = '/CountProduct';

  ///
  static const String reportCompany = '/ReportCompany';

  ///
  static const String newSuppliers = '/NewSuppliers';
  static const String moneySuppliers = '/MoneySuppliers';
  static const String viewPaymentSuppliers = '/ViewPaymentSuppliers';
  static const String viewSuppliers = '/ViewSuppliers';

  ///
  static const String moneyClients = '/MoneyClients';
  static const String newClients = '/NewClients';
  static const String viewClients = '/ViewClients';
  static const String viewPaymentClients = '/ViewPaymentClients';

  ///
  static const String newRepresentatives = '/NewRepresentatives';
  static const String Representatives = '/Representatives';
  static const String viewRepresentatives = '/ViewRepresentatives';

  ///
  static const String dailyExpenses = '/DailyExpenses';
  static const String monthExpenses = '/MonthExpenses';



  static const String buyingBillReport = '/BuyingBillReport';
  static const String detailsBillReportBuying = '/DetailsBillReportBuying';



  static const String sellingBillReport = '/SellingBillReport';
  static const String detailsBillReportSelling = '/DetailsBillReportSelling';



  static const String treasuryTransactionsReport = '/TreasuryTransactionsReport';

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
        path: Representatives,
        builder: (BuildContext context, GoRouterState state) {
          return Representative();
        },
      ),
      GoRoute(
        path: Supplier,
        builder: (BuildContext context, GoRouterState state) {
          return Suppliers();
        },
      ),
      GoRoute(
        path: Client,
        builder: (BuildContext context, GoRouterState state) {
          return Clients();
        },
      ),
      GoRoute(
        path: expenses,
        builder: (BuildContext context, GoRouterState state) {
          return Expenses();
        },
      ),

      GoRoute(
        path: sell,
        builder: (BuildContext context, GoRouterState state) {
          return Sell();
        },
      ),
      GoRoute(
        path: buy,
        builder: (BuildContext context, GoRouterState state) {
          return Buy();
        },
      ),
      GoRoute(
        path: dailyExpenses,
        builder: (BuildContext context, GoRouterState state) {
          return DailyExpenses();
        },
      ),
      GoRoute(
        path: monthExpenses,
        builder: (BuildContext context, GoRouterState state) {
          return MonthExpenses();
        },
      ),
      GoRoute(
        path: reports,
        builder: (BuildContext context, GoRouterState state) {
          return Reports();
        },
      ),

      ///

      ///
      GoRoute(
        path: newProduct,
        builder: (BuildContext context, GoRouterState state) {
          return NewProduct();
        },
      ),
      GoRoute(
        path: newRepresentatives,
        builder: (BuildContext context, GoRouterState state) {
          return NewRepresentatives();
        },
      ),
      GoRoute(
        path: moneySuppliers,
        builder: (BuildContext context, GoRouterState state) {
          return MoneySuppliers();
        },
      ),
      GoRoute(
        path: moneyClients,
        builder: (BuildContext context, GoRouterState state) {
          return MoneyClients();
        },
      ),
      GoRoute(
        path: newSuppliers,
        builder: (BuildContext context, GoRouterState state) {
          return NewSuppliers();
        },
      ),
      GoRoute(
        path: newClients,
        builder: (BuildContext context, GoRouterState state) {
          return NewClients();
        },
      ),
      GoRoute(
        path: viewProduct,
        builder: (BuildContext context, GoRouterState state) {
          return ViewProduct();
        },
      ),
      GoRoute(
        path: viewPaymentSuppliers,
        builder: (BuildContext context, GoRouterState state) {
          return ViewPaymentSuppliers();
        },
      ),
      GoRoute(
        path: viewPaymentClients,
        builder: (BuildContext context, GoRouterState state) {
          return ViewPaymentClients();
        },
      ),
      GoRoute(
        path: viewSuppliers,
        builder: (BuildContext context, GoRouterState state) {
          return ViewSuppliers();
        },
      ),
      GoRoute(
        path: viewClients,
        builder: (BuildContext context, GoRouterState state) {
          return ViewClients();
        },
      ),
      GoRoute(
        path: viewRepresentatives,
        builder: (BuildContext context, GoRouterState state) {
          return ViewRepresentatives();
        },
      ),
      GoRoute(
        path: countProduct,
        builder: (BuildContext context, GoRouterState state) {
          return CountProduct();
        },
      ),
      GoRoute(
        path: reportCompany,
        builder: (BuildContext context, GoRouterState state) {
          return ReportCompany();
        },
      ),
      GoRoute(
        path: buyingBillReport,
        builder: (BuildContext context, GoRouterState state) {
          return BuyingBillReport();
        },
      ),
      GoRoute(
        path: detailsBillReportBuying,
        builder: (BuildContext context, GoRouterState state) {
          return DetailsBillReportBuying();
        },
      ),
      GoRoute(
        path: sellingBillReport,
        builder: (BuildContext context, GoRouterState state) {
          return SellingBillReport();
        },
      ),
      GoRoute(
        path: detailsBillReportSelling,
        builder: (BuildContext context, GoRouterState state) {
          return DetailsBillReportSelling();
        },
      ), GoRoute(
        path: treasuryTransactionsReport,
        builder: (BuildContext context, GoRouterState state) {
          return TreasuryTransactionsReport();
        },
      ),


    ],
  );
}
