import 'package:cache_repo/core/utils/styles.dart';
import 'package:flutter/material.dart';

Widget monthExpensesItemList(

    ) => Container(
      color: Colors.grey[200],
      height: 60,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'ملاحظات ',
              style: Styles.textStyle16,
            ),
            Text('التاريخ', style: Styles.textStyle16),
            Text('المبلغ', style: Styles.textStyle16),
          ],
        ),
      ),
    );
