import 'package:cache_repo/core/utils/colors.dart';
import 'package:cache_repo/core/utils/styles.dart';
import 'package:flutter/material.dart';

Widget headerViewDetailsBillReportBuying(context) => Row(
  children: [
    Expanded(
      child: Container(
        color: ColorsApp.defualtColor,
        height: MediaQuery.of(context).size.height * 0.075,
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.02,
            vertical: MediaQuery.of(context).size.height * 0.01,
          ),
          child: Row(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.06,
              ),
              Expanded(
                child: Text(
                  'الاجمالى',
                  style: Styles.textStyle15.copyWith(
                    fontSize: MediaQuery.of(context).size.width * 0.03,
                  ),
                ),
              ),
              Expanded(
                child: Text(
                  'سعر الشراء',
                  style: Styles.textStyle15.copyWith(
                    fontSize: MediaQuery.of(context).size.width * 0.03,
                  ),
                ),
              ),
              Expanded(
                child: Text(
                  'الكميه',
                  style: Styles.textStyle15.copyWith(
                    fontSize: MediaQuery.of(context).size.width * 0.03,
                  ),
                ),
              ),
              Expanded(
                child: Text(
                  'اسم الصنف',
                  style: Styles.textStyle15.copyWith(
                    fontSize: MediaQuery.of(context).size.width * 0.03,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  ],
);