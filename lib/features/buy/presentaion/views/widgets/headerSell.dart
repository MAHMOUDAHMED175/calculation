import 'package:cache_repo/core/utils/colors.dart';
import 'package:cache_repo/core/utils/styles.dart';
import 'package:flutter/material.dart';

Widget headerSell() => Container(
      color: ColorsApp.defualtColor,
      height: 60,
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Row(
          children: [
            Expanded(
                child: Text(
              'الاجمالى',
              style: Styles.textStyle15,
            )),
            Expanded(
                child: Text(
              'الكميه ',
              style: Styles.textStyle15,
            )),
            Expanded(child: Text('السعر', style: Styles.textStyle15)),
            Expanded(child: Text('المنتج', style: Styles.textStyle15)),
            Expanded(child: Text('صوره المنتج', style: Styles.textStyle15)),
          ],
        ),
      ),
    );
