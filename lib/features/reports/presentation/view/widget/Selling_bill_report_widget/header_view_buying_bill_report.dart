import 'package:cache_repo/core/utils/colors.dart';
import 'package:cache_repo/core/utils/styles.dart';
import 'package:flutter/material.dart';

Widget headerViewSellingBillReport(context) => Row(
  children: [
    Expanded(
      child: Container(
        color: ColorsApp.defualtColor,
        height: MediaQuery.of(context).size.height * 0.13,
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.02,
            vertical: MediaQuery.of(context).size.height * 0.01,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.1,
              ),

              Column(
                children: [

                  Expanded(
                    child: Text(
                      'رقم الفاتوره',
                      style: Styles.textStyle15
                    ),
                  ),
                  Expanded(
                    child: Text(
                      "اسم العميل",
                      style: Styles.textStyle15
                    ),
                  ),
                ],
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.1,
              ),
              Column(
                children: [

                  Expanded(
                    child: Text(
                      "الاجمالى",
                      style: Styles.textStyle15
                    ),
                  ),
                  Expanded(
                    child: Text(
                      "تاريخ البيع",
                      style: Styles.textStyle15
                    ),
                  ),
                ],
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.1,
              ),
            ],
          ),
        ),
      ),
    ),
  ],
);