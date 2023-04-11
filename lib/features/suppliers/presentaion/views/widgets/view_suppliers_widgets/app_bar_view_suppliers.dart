import 'package:cache_repo/core/widgets/custom_app_par.dart';
import 'package:flutter/material.dart';

class AppBarVieSuppliers extends StatelessWidget {
  const AppBarVieSuppliers({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomAppBar(
        textAppBar: 'عرض الموردين',
        elevationAppBar: 0.0,
        showenCenterText: true,
        actionsAppBar: []);
  }
}
