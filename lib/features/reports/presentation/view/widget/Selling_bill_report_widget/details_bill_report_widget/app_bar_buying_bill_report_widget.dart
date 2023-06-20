import 'package:cache_repo/core/widgets/custom_app_par.dart';
import 'package:flutter/material.dart';

class AppBarDetailsBillReportSelling extends StatelessWidget {
  const AppBarDetailsBillReportSelling({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomAppBar(
        textAppBar: 'عرض تفاصيل الفاتوره',
        elevationAppBar: 0.0,
        leadingAppBar: Icon(Icons.arrow_back_ios),
        showenCenterText: true,
        actionsAppBar: []);
  }
}
