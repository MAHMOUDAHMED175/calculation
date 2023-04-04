import 'package:cache_repo/core/widgets/custom_app_par.dart';
import 'package:flutter/material.dart';

class AppBarNewProduct extends StatelessWidget {
  const AppBarNewProduct({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomAppBar(
        textAppBar: 'اضافة منتج جديد',
        elevationAppBar: 0.0,
        showenCenterText: true,
        actionsAppBar: []);
  }
}
