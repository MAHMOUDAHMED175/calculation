
import 'package:cache_repo/core/widgets/custom_app_par.dart';
import 'package:flutter/material.dart';

class AppBarMoneyClients extends StatelessWidget {
  const AppBarMoneyClients({Key? key, required this.moneyCount}) : super(key: key);

  final  double  moneyCount;
  @override
  Widget build(BuildContext context) {
    return CustomAppBar(
        textAppBar: "المبالغ المتبقيه عند العملاء",
        widget: Text(' اجمالى المبلغ المتبقى عند العملاء $moneyCount   جنيه',style: TextStyle(
            color: Colors.white
        ),),

        elevationAppBar: 0.0,
        showenCenterText: true,
        actionsAppBar: []);
  }
}
