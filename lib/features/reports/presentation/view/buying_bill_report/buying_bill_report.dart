import 'package:cache_repo/features/reports/presentation/view/widget/buying_bill_report_widget/date_daily_buying_bill_report.dart';
import 'package:cache_repo/features/reports/presentation/view/widget/buying_bill_report_widget/header_view_buying_bill_report.dart';
import 'package:cache_repo/features/reports/presentation/view/widget/buying_bill_report_widget/item_list_buying_bill_report.dart';
import 'package:flutter/material.dart';

import '../widget/buying_bill_report_widget/app_bar_buying_bill_report_widget.dart';

class BuyingBillReport extends StatelessWidget {
  BuyingBillReport({Key? key}) : super(key: key);

  var dateDailyBuyingBillReportController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          child: AppBarBuyingBillReport(), preferredSize: Size.fromHeight(60)),
      body: Column(
        children: [
          dateDailyBuyingBillReport(
              context, dateDailyBuyingBillReportController),
          headerViewBuyingBillReport(context),
          Expanded(
            child: ListView.separated(
                itemBuilder: (context, index) {
                  return ItemListBuyingBillReport();
                },
                separatorBuilder: (context, index) {
                  return Container(
                    color: Colors.black,
                    height: 1,
                    width: double.infinity,
                  );
                },
                itemCount: 999999999999999999),
          )
        ],
      ),
    );
  }
}
