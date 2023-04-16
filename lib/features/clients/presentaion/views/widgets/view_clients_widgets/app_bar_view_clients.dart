import 'package:cache_repo/core/widgets/custom_app_par.dart';
import 'package:flutter/material.dart';

class AppBarVieClients extends StatelessWidget {
  const AppBarVieClients({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomAppBar(
        textAppBar: 'عرض العملاء',
        elevationAppBar: 0.0,
        showenCenterText: true,
        actionsAppBar: []);
  }
}
