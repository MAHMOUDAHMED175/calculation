import 'package:cache_repo/core/utils/styles.dart';
import 'package:cache_repo/features/reports/presentation/view/widget/Selling_bill_report_widget/details_bill_report_widget/app_bar_buying_bill_report_widget.dart';
import 'package:cache_repo/features/reports/presentation/view/widget/Selling_bill_report_widget/details_bill_report_widget/header_view_Details_bill_report.dart';
import 'package:cache_repo/features/reports/presentation/view/widget/Selling_bill_report_widget/details_bill_report_widget/item_list_details_bill_report.dart';
import 'package:flutter/material.dart';

class DetailsBillReportSelling extends StatelessWidget {
  const DetailsBillReportSelling({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          child: AppBarDetailsBillReportSelling(),
          preferredSize: Size.fromHeight(60)),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(
                left: 40, right: 40.0, top: 20, bottom: 20),
            child: Container(
              height: 50,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30.0)),
              width: MediaQuery.of(context).size.height * 1,
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Row(
                  children: [
                    Icon(Icons.battery_alert_outlined),
                    SizedBox(
                      width: 20,
                    ),
                    Expanded(
                        child: Text(
                      '01231245678521',
                      style: Styles.textStyle16,
                    )),
                  ],
                ),
              ),
            ),
          ),
          headerViewDetailsBillReportSelling(context),
          Expanded(
            child: ListView.separated(
                itemBuilder: (context, index) {
                  return ItemListDetailsBillReportSelling();
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
