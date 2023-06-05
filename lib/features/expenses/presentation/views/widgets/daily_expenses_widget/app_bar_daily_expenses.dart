import 'package:cache_repo/core/utils/colors.dart';
import 'package:cache_repo/core/widgets/custom_app_par.dart';
import 'package:flutter/material.dart';

class AppBarDailyExpenses extends StatelessWidget {
  const AppBarDailyExpenses({Key? key, required this.dailyMoneyExpenses}) : super(key: key);

  final  double  dailyMoneyExpenses;
  @override
  Widget build(BuildContext context) {
    return CustomAppBar(
        textAppBar: "تقرير بالمصروفات اليوميه",
        widget: Text(' الاجمالى$dailyMoneyExpenses   جنيه',style: TextStyle(
            color: ColorsApp.whiteColor
        ),),

        elevationAppBar: 0.0,
        showenCenterText: true,
        actionsAppBar: []);
  }
}
