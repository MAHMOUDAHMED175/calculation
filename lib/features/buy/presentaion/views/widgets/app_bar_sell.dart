



import 'package:cache_repo/core/widgets/custom_app_par.dart';
import 'package:flutter/material.dart';

class AppBarSell extends StatelessWidget {
  const AppBarSell({Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomAppBar(
        textAppBar: "المشتريات",
        elevationAppBar: 0.0,
        showenCenterText: true,
        actionsAppBar: []);
  }
}
