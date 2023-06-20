import 'package:cache_repo/core/utils/colors.dart';
import 'package:cache_repo/core/utils/styles.dart';
import 'package:flutter/material.dart';

Future MoneyAtTheSellingPrice(context,text,price) => showDialog(
  context: context,
  builder: (context) => Dialog(
    alignment: Alignment.center,
    elevation: 10,
    child: LayoutBuilder(
      builder: (context, constraints) {
        final dialogWidth = constraints.maxWidth;
        final dialogHeight = constraints.maxHeight;

        return Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                Icons.add_home_work_sharp,
                size: dialogHeight * 0.25,
                color: ColorsApp.defualtColor,
              ),
              SizedBox(height: dialogHeight * 0.03),
              Text(
                'اجمالى راس المال بسعر $text',
                style: Styles.textStyle25,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: dialogHeight * 0.02),
              Text(
                '$price جنيه',
                style: Styles.textStyle25,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: dialogHeight * 0.03),
              TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: ColorsApp.defualtColor,
                  padding: EdgeInsets.symmetric(
                    vertical: dialogHeight * 0.015,
                    horizontal: dialogWidth * 0.05,
                  ),
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(
                  'خروج',
                  style: Styles.textStyle15.copyWith(
                    color: ColorsApp.whiteText,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    ),
  ),
);
