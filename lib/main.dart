import 'package:cache_repo/confg/app_route.dart';
import 'package:cache_repo/confg/observer.dart';
import 'package:cache_repo/core/utils/colors.dart';
import 'package:cache_repo/core/utils/dioHelper.dart';
import 'package:cache_repo/core/utils/service_locator.dart';
import 'package:cache_repo/features/buy/presentaion/views_models/managers/cubit/buy_cubit.dart';
import 'package:cache_repo/features/representatives/presentaion/views_models/managers/representatives_cubit.dart';
import 'package:cache_repo/features/sell/presentaion/views_models/managers/cubit/sell_cubit.dart';
import 'package:cache_repo/features/store/presentaion/views_models/managers/cubit/cubit.dart';
import 'package:cache_repo/features/suppliers/presentaion/views_models/managers/cubit/supplires_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  await DioHelper.Init();
  setupServiceLocator();
  runApp(const CacheRepo());
}

class CacheRepo extends StatelessWidget {
  const CacheRepo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (BuildContext context) {
            return StoreCubit()..CreateDatabase();
            // ..ProductTree()
            // ..FechProducts();
          }),
          BlocProvider(create: (BuildContext context) {
            return BuyCubit();
          }),
          BlocProvider(create: (BuildContext context) {
            return SellCubit();
          }),
          BlocProvider(create: (BuildContext context) {
            return RepresentativesCubit()..CreateDatabaseRepresent();
          }),
          BlocProvider(create: (BuildContext context) {
            return SuppliersCubit()..CreateDatabaseSuppliers();
          }),
        ],
        child: MaterialApp.router(
          routerConfig: AppRoute.router,
          // home: ImageScreen(),
          debugShowCheckedModeBanner: false,
          theme: ThemeData.light().copyWith(
            scaffoldBackgroundColor: ColorsApp.scaffoldColor,
            textTheme:
                GoogleFonts.montserratTextTheme(ThemeData.light().textTheme),
          ),
        ));
  }
}
