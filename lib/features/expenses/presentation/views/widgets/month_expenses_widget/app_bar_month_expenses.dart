import 'package:cache_repo/core/utils/colors.dart';
import 'package:cache_repo/core/widgets/custom_app_par.dart';
import 'package:flutter/material.dart';

class AppBarMonthExpenses extends StatelessWidget {
  const AppBarMonthExpenses({Key? key, required this.monthMoneyExpenses}) : super(key: key);

  final  double  monthMoneyExpenses;
  @override
  Widget build(BuildContext context) {
    return CustomAppBar(
        textAppBar: "تقرير بالمصروفات الشهريه",
        widget: Text(' الاجمالى$monthMoneyExpenses   جنيه',style: TextStyle(
            color: ColorsApp.whiteColor
        ),),

        elevationAppBar: 0.0,
        showenCenterText: true,
        actionsAppBar: []);
  }
}
