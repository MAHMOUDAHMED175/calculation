import 'package:cache_repo/core/widgets/custom_app_par.dart';
import 'package:flutter/material.dart';

class AppBarViewClients extends StatelessWidget {
  const AppBarViewClients({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomAppBar(
        textAppBar: 'عرض تفصيلى لحساب العميل',
        elevationAppBar: 0.0,
        showenCenterText: true,
        actionsAppBar: []);
  }
}