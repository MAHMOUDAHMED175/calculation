import 'package:cache_repo/core/utils/colors.dart';
import 'package:cache_repo/core/utils/styles.dart';
import 'package:flutter/material.dart';

Widget headerViewTreasuryTransactionsReport(BuildContext context) => Container(
  color: ColorsApp.defualtColor,
  height: MediaQuery.of(context).size.height * 0.1,
  child: Padding(
    padding: EdgeInsets.symmetric(
      horizontal: MediaQuery.of(context).size.width * 0.02,
      vertical: MediaQuery.of(context).size.height * 0.01,
    ),
    child: Row(
      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [

        Expanded(
          child: Text(
            'ملاحظات',
            style: Styles.textStyle15,
            textAlign: TextAlign.center,
          ),
        ),
        Expanded(
          child: Text(
            " التاريخ",
            style: Styles.textStyle15,
            textAlign: TextAlign.center,
          ),
        ),

        Expanded(
          child: Text(
            "المتبقى بعد العمليه",
            style: Styles.textStyle15,
            textAlign: TextAlign.center,
          ),
        ),
        Expanded(
          child: Text(
            " المبلغ",
            style: Styles.textStyle15,
            textAlign: TextAlign.center,
          ),
        ),
        Expanded(
          child: Text(
            " العمليه",
            style: Styles.textStyle15,
            textAlign: TextAlign.center,
          ),
        ),

      ],
    ),
  ),
);
