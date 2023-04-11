import 'package:cache_repo/core/widgets/custom_app_par.dart';
import 'package:flutter/material.dart';

class AppBarNewClients extends StatelessWidget {
  const AppBarNewClients({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomAppBar(
        textAppBar: 'تسجيل عميل جديد',
        elevationAppBar: 0.0,
        showenCenterText: true,
        actionsAppBar: []);
  }
}
