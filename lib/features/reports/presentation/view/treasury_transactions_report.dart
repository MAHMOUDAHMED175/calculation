import 'package:flutter/material.dart';

import 'widget/treasury_transactions_report_widget/app_bar_treasury_transactions_report_widget.dart';
import 'widget/treasury_transactions_report_widget/date_daily_treasury_transactions_report.dart';
import 'widget/treasury_transactions_report_widget/header_view_treasury_transactions_report.dart';
import 'widget/treasury_transactions_report_widget/item_list_treasury_transactions_report.dart';

class TreasuryTransactionsReport extends StatelessWidget {
  TreasuryTransactionsReport({Key? key}) : super(key: key);

  var dateDailyTreasuryTransactionsReportController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          child: AppBarTreasuryTransactionsReport(),
          preferredSize: Size.fromHeight(60)),
      body: Column(
        children: [
          dateDailyTreasuryTransactionsReport(
              context, dateDailyTreasuryTransactionsReportController),
          headerViewTreasuryTransactionsReport(context),
          Expanded(
            child: ListView.separated(
                itemBuilder: (context, index) {
                  return ItemListTreasuryTransactionsReport();
                },
                separatorBuilder: (context, index) {
                  return Container(
                    color: Colors.black,
                    height: 1,
                    width: double.infinity,
                  );
                },
                itemCount: 9),
          )

        ],
      ),
    );
  }
}
