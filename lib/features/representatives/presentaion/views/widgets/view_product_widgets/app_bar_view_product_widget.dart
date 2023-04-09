import 'package:cache_repo/core/widgets/custom_app_par.dart';
import 'package:flutter/material.dart';

class AppBarViewProduct extends StatelessWidget {
  const AppBarViewProduct({Key? key, required this.moneyCount}) : super(key: key);

  final  double  moneyCount;
  @override
  Widget build(BuildContext context) {
    return CustomAppBar(
        textAppBar: "المنتجات المتوفره فى المخزن ",
        widget: Text(' اجمالى رأس المال $moneyCount   جنيه',style: TextStyle(
          color: Colors.white
        ),),

        elevationAppBar: 0.0,
        showenCenterText: true,
        actionsAppBar: []);
  }
}
