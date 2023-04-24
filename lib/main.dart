import 'package:cache_repo/confg/app_route.dart';
import 'package:cache_repo/confg/observer.dart';
import 'package:cache_repo/core/utils/colors.dart';
import 'package:cache_repo/features/store/presentaion/views_models/managers/cubit/cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';



void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  // ServiceLocators().setupServiceLocator();
  runApp(const CacheRepo());
}

class CacheRepo extends StatelessWidget {
  const CacheRepo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (BuildContext context) {

            return StoreCubit()..CreateDatabase();}),

        ],
        child:
               MaterialApp.router(
                  routerConfig: AppRoute.router,
                  // home: ImageScreen(),
                  debugShowCheckedModeBanner: false,
                  theme: ThemeData.light().copyWith(
                    scaffoldBackgroundColor: ColorsApp.scaffoldColor,
                    textTheme:
                    GoogleFonts.montserratTextTheme(ThemeData.light().textTheme),
                  ),

              )
    );
  }
}
