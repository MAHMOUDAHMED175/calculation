
import 'package:cache_repo/core/widgets/custom_app_par.dart';
import 'package:flutter/material.dart';

class AppBarMoneyClients extends StatelessWidget {
   AppBarMoneyClients({Key? key, required int moneyCount,}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return CustomAppBar(
        textAppBar: "المبالغ المتبقيه للعملاء",
        // widget: Text(' اجمالى المبلغ المتبقى للموردين ${ClientsCubit.get(context).d}   جنيه',style: TextStyle(
        //     color: Colors.white
        // ),),

        elevationAppBar: 0.0,
        showenCenterText: true,
        actionsAppBar: []);
  }
}
