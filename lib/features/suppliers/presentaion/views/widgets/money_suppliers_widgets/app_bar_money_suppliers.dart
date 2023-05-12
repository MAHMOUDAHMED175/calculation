
import 'package:cache_repo/core/widgets/custom_app_par.dart';
import 'package:cache_repo/features/suppliers/presentaion/views_models/managers/cubit/supplires_cubit.dart';
import 'package:flutter/material.dart';

class AppBarMoneySuppliers extends StatelessWidget {
   AppBarMoneySuppliers({Key? key,}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return CustomAppBar(
        textAppBar: "المبالغ المتبقيه للموردين",
        // widget: Text(' اجمالى المبلغ المتبقى للموردين ${SuppliersCubit.get(context).d}   جنيه',style: TextStyle(
        //     color: Colors.white
        // ),),

        elevationAppBar: 0.0,
        showenCenterText: true,
        actionsAppBar: []);
  }
}
