import 'package:cache_repo/core/utils/colors.dart';
import 'package:cache_repo/core/utils/styles.dart';
import 'package:flutter/cupertino.dart';

Widget headerDailyExpenses() => Container(
      color: ColorsApp.defualtColor,
      height: 60,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'ملاحظات ',
              style: Styles.textStyle15,
            ),
            Text('التاريخ', style: Styles.textStyle15),
            Text('المبلغ', style: Styles.textStyle15),
          ],
        ),
      ),
    );
