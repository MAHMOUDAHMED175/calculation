

import 'package:cache_repo/features/reports/presentation/view/widget/report_company_widgets/app_bar_report_company.dart';
import 'package:cache_repo/features/reports/presentation/view/widget/report_company_widgets/date_report_company.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/colors.dart';
import '../../../../../core/utils/styles.dart';

class ReportCompany extends StatelessWidget {
   ReportCompany({Key? key}) : super(key: key);

  var dateReportCompanyController=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(60),
          child: AppBarReportCompany(),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            dateReportCompany(context,dateReportCompanyController),
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
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [

                    Icon(Icons.production_quantity_limits,size: 70,color:ColorsApp.defualtColor),

                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'اجمالى المبيعات',
                          style: Styles.textStyle25.copyWith(color: ColorsApp.defualtColor),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(' جنيه 0',style: Styles.textStyle15.copyWith(color: Colors.red),),
                      ],
                    ),
                  ],
                ),
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
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [

                    Icon(Icons.sell,size: 70,color:ColorsApp.defualtColor),

                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'اجمالى المشتريات',
                          style: Styles.textStyle25.copyWith(color: ColorsApp.defualtColor),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(' جنيه 0',style: Styles.textStyle15.copyWith(color: Colors.red),),
                      ],
                    ),
                  ],
                ),
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
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [

                    Icon(Icons.data_thresholding_outlined,color:ColorsApp.defualtColor,size: 70,),

                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'اجمالى الارباح',
                          style: Styles.textStyle25.copyWith(color: ColorsApp.defualtColor),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(' جنيه 0',style: Styles.textStyle15.copyWith(color: Colors.red),),
                      ],
                    ),
                  ],
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
