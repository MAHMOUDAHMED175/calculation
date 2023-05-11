import 'package:cache_repo/core/utils/colors.dart';
import 'package:cache_repo/core/utils/styles.dart';
import 'package:flutter/material.dart';

Widget headerViewRepresentatives(context) => Row(
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
                width: MediaQuery.of(context).size.width * 0.1,
              ),
              Expanded(
                flex: 2,
                child: Text(
                  'رقم الهاتف ',
                  style: Styles.textStyle15.copyWith(
                    fontSize: MediaQuery.of(context).size.width * 0.03,
                  ),
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.1,
              ),
              Expanded(
                flex: 2,
                child: Text(
                  'اسم الكاشير',
                  style: Styles.textStyle15.copyWith(
                    fontSize: MediaQuery.of(context).size.width * 0.03,
                  ),
                ),
              ),
              Expanded(
                flex: 0,
                child: Text(
                  'صوره الكاشير',
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