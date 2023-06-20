import 'package:cache_repo/core/utils/colors.dart';
import 'package:cache_repo/core/utils/styles.dart';
import 'package:cache_repo/core/widgets/button_reports_widget.dart';
import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../confg/app_route.dart';
import 'money_at_the_selling_price.dart';
import 'widget/report_widgets/app_bar_reports_widget/app_bar_reports.dart';

class Reports extends StatelessWidget {
  const Reports({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(60), child: AppBarReports()),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    color: ColorsApp.whiteCard,
                    boxShadow: [
                      BoxShadow(color: Colors.grey, blurRadius: 10.0),
                      BoxShadow(color: Colors.grey, blurRadius: 10.0),
                    ]),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.data_thresholding_rounded,
                        size: 180.0,
                        color: ColorsApp.defualtColor,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'اليوم',
                        style: Styles.textStyle16,
                      ),
                      Text(
                        '${formatDate(DateTime.now(), [
                              yyyy,
                              '-',
                              mm,
                              '-',
                              dd
                            ])}',
                        style: Styles.textStyle16
                            .copyWith(color: ColorsApp.defualtColor),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 160,
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    color: ColorsApp.whiteCard,
                    boxShadow: [
                      BoxShadow(color: Colors.grey, blurRadius: 10.0),
                      BoxShadow(color: Colors.grey, blurRadius: 10.0),
                    ]),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'المتجر',
                      style: Styles.textStyle25,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    InkWell(
                      onTap: () {
                        GoRouter.of(context).push(AppRoute.reportCompany);
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              color: ColorsApp.defualtColor),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Center(
                              child: Text(
                                'عرض حركه الشركه اليوميه',
                                style: Styles.textStyle15.copyWith(
                                  color: ColorsApp.whiteColor,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    color: ColorsApp.whiteCard,
                    boxShadow: [
                      BoxShadow(color: Colors.grey, blurRadius: 10.0),
                      BoxShadow(color: Colors.grey, blurRadius: 10.0),
                    ]),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'تقارير مفصله',
                      style: Styles.textStyle25,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        children: [
                          buttonsReports(
                            function: () {
                              GoRouter.of(context).push(AppRoute.reportCompany);
                            },
                            text: 'تقرير بالارباح الشهريه',
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          buttonsReports(
                            function: () {
                              GoRouter.of(context).push(AppRoute.dailyExpenses);
                            },
                            text: 'تقرير بالمصروفات اليوميه',
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          buttonsReports(
                            function: () {
                              GoRouter.of(context).push(AppRoute.monthExpenses);
                            },
                            text: 'تقرير بالمصروفات الشهريه',
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          buttonsReports(
                              function: () {
                                GoRouter.of(context)
                                    .push(AppRoute.sellingBillReport);
                              },
                              text: 'عرض فواتير المبيعات'),
                          SizedBox(
                            height: 20,
                          ),
                          buttonsReports(
                            function: () {
                              GoRouter.of(context)
                                  .push(AppRoute.buyingBillReport);
                            },
                            text: 'عرض فواتير المشتريات',
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          buttonsReports(
                            function: () {
                              GoRouter.of(context)
                                  .push(AppRoute.treasuryTransactionsReport);
                            },
                            text: 'تقرير بتعاملات الخزينه',
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          buttonsReports(
                            function: () {
                              GoRouter.of(context).push(AppRoute.moneyClients);
                            },
                            text: 'تقرير بالمبالغ الباقيه عند العملاء',
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          buttonsReports(
                            function: () {
                              GoRouter.of(context)
                                  .push(AppRoute.moneySuppliers);
                            },
                            text: 'تقرير بالمبالغ الباقيه للموردين',
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          buttonsReports(
                            function: () {
                              GoRouter.of(context).push(AppRoute.viewProduct);
                            },
                            text: 'جرد البضاعه فى المخزن',
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          buttonsReports(
                            function: () {
                              MoneyAtTheSellingPrice(
                                  context, 'الشراء', 222229999);
                            },
                            text: 'اجمالى رأس المال بسعر الشراء',
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          buttonsReports(
                            function: () {
                              MoneyAtTheSellingPrice(context, 'البيع', 1235458);
                            },
                            text: 'اجمالى رأس المال بسعر البيع',
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
