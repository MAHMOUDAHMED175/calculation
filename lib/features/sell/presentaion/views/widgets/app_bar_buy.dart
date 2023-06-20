import 'package:cache_repo/core/widgets/custom_app_par.dart';
import 'package:flutter/material.dart';

class AppBarBuy extends StatelessWidget {
  const AppBarBuy({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomAppBar(
        textAppBar: "المبيعات",
        elevationAppBar: 0.0,
        showenCenterText: true,
        actionsAppBar: []);
  }
}
