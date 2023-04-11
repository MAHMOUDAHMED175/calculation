import 'package:cache_repo/core/widgets/custom_app_par.dart';
import 'package:flutter/material.dart';

class AppBarViewSuppliers extends StatelessWidget {
  const AppBarViewSuppliers({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomAppBar(
        textAppBar: 'عرض تفصيلى لحساب المورد',
        elevationAppBar: 0.0,
        showenCenterText: true,
        actionsAppBar: []);
  }
}