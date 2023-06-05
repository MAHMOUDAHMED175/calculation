import 'package:cache_repo/confg/app_route.dart';
import 'package:cache_repo/core/utils/colors.dart';
import 'package:cache_repo/core/utils/styles.dart';
import 'package:cache_repo/features/expenses/presentation/views/widgets/app_bar_expenses_widget/app_bar_expenses.dart';
import 'package:cache_repo/features/expenses/presentation/views/widgets/card_expenses_widget/card_expenses.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Expenses extends StatelessWidget {
  Expenses({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsApp.scaffoldColor,
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(60), child: AppBarExpenses()),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              CardExpenses(),
              SizedBox(
                height: 15,
              ),
              //تقرير بالمصروفات اليوميه
              InkWell(
                onTap: (){
                  GoRouter.of(context).push(AppRoute.dailyExpenses);

                },
                child: Container(
                  width: double.infinity,
                  decoration:BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: ColorsApp.defualtColor
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                      child: Text(
                        'تقرير بالمصروفات اليوميه',
                        style: Styles.textStyle20.copyWith(
                          color: ColorsApp.whiteColor,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              //تقرير بالمصروفات الشهريه
              InkWell(
                onTap: (){
                  GoRouter.of(context).push(AppRoute.monthExpenses);
                },
                child: Container(
                  width: double.infinity,
                  decoration:BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: ColorsApp.defualtColor
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                      child: Text(
                        'تقرير بالمصروفات الشهريه',
                        style: Styles.textStyle20.copyWith(
                          color: ColorsApp.whiteColor,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
