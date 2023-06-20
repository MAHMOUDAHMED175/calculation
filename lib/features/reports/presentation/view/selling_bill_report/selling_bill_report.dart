import 'package:cache_repo/features/reports/presentation/view/widget/Selling_bill_report_widget/app_bar_Selling_bill_report_widget.dart';
import 'package:cache_repo/features/reports/presentation/view/widget/Selling_bill_report_widget/date_daily_selling_bill_report.dart';
import 'package:cache_repo/features/reports/presentation/view/widget/Selling_bill_report_widget/header_view_buying_bill_report.dart';
import 'package:cache_repo/features/reports/presentation/view/widget/Selling_bill_report_widget/item_list_selling_bill_report.dart';
import 'package:flutter/material.dart';

class SellingBillReport extends StatelessWidget {
  SellingBillReport({Key? key}) : super(key: key);

  var dateDailySellingBillReportController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          child: AppBarSellingBillReport(), preferredSize: Size.fromHeight(60)),
      body: Column(
        children: [
          dateDailySellingBillReport(
              context, dateDailySellingBillReportController),
          headerViewSellingBillReport(context),
          Expanded(
            child: ListView.separated(
                itemBuilder: (context, index) {
                  return ItemListSellingBillReport();
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
