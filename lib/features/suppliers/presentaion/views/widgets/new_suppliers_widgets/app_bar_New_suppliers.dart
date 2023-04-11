import 'package:cache_repo/core/widgets/custom_app_par.dart';
import 'package:flutter/material.dart';

class AppBarNewSuppliers extends StatelessWidget {
  const AppBarNewSuppliers({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomAppBar(
        textAppBar: 'تسجيل مورد جديد',
        elevationAppBar: 0.0,
        showenCenterText: true,
        actionsAppBar: []);
  }
}
